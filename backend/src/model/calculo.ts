import mongo from '../database/mongo';
import ciudadModel from '../model/ciudadModel';
import rutaModel from '../model/rutaModel';
import configuracionModel from '../model/configuracionModel';
import promedioVelocidadModel from '../model/promedioVelocidadModel';
import costoFijoModel from '../model/costoFijoModel';
import tipoVehiculoModel from '../model/tipoVehiculoModel';
import costoVariableModel from '../model/costoVariableModel';
import promedioConsumoModel from '../model/promedioConsumoModel';
import rutaPeajeModel from '../model/rutapeajeModel';
import peajeModel from '../model/peajeModel';
class calculo {
    private peaje: peajeModel;
    private rutapeaje: rutaPeajeModel;
    private consumos: promedioConsumoModel;
    private variables: costoVariableModel
    private vehiculo: tipoVehiculoModel;
    private ciudad: ciudadModel;
    private ruta: rutaModel;
    private configuracion: configuracionModel;
    private velocidades: promedioVelocidadModel;
    private fijos: costoFijoModel;
    constructor() {
        this.peaje = new peajeModel();
        this.rutapeaje = new rutaPeajeModel();
        this.consumos = new promedioConsumoModel();
        this.variables = new costoVariableModel();
        this.vehiculo = new tipoVehiculoModel();
        this.fijos = new costoFijoModel();
        this.ciudad = new ciudadModel();
        this.ruta = new rutaModel();
        this.configuracion = new configuracionModel();
        this.velocidades = new promedioVelocidadModel();
    }
    public horasViaje(ruta: any, velocidades: any, espera: number): any {
        const horasViaje: number = (ruta.planoRuta / velocidades.plano) + (ruta.onduladoRuta / velocidades.ondulado) + (ruta.montanaRuta / velocidades.montana) + (ruta.urbanoRuta / velocidades.urbano) + (ruta.despavimentadoRuta / velocidades.despavimentado)
        const horasRecorrido: number = horasViaje + espera
        const recorridosMes: number = 288 / horasViaje
        const recorridosConEsperaMes = 288 / horasRecorrido;
        return [horasRecorrido, recorridosMes, recorridosConEsperaMes]
    }
    public calcularFijos(items: any, viajes: number, peso: number): any {
        const nombres: any[] = []
        const valoresViaje: number[] = []
        const valoresTonelada: number[] = []
        for (let index = 0; index < items.length; index++) {
            nombres.push(items[index].nombreItemFijo)
            valoresViaje.push(items[index].nuevoValorItem / viajes)
            valoresTonelada.push(items[index].nuevoValorItem / (viajes * peso))
        }
        return { 'nombresItems': nombres, 'valoresViaje': valoresViaje, 'ValoresXton': valoresTonelada }
    }
    public combustible(ruta: any, consumos: any) {
        const res: number = 9357 * ((ruta.planoRuta / consumos.plano) + (ruta.onduladoRuta / consumos.ondulado) + (ruta.montanaRuta / consumos.montana) + (ruta.urbanoRuta / consumos.urbano) + (ruta.despavimentadoRuta / consumos.despavimentado))
        return res
    }
    public async peajes(listaPeajes: any, categoria: number) {
        let total = 0
        switch (categoria) {
            case 2:
                for (let index = 0; index < listaPeajes.length; index++) {
                    const temp: any = await this.peaje.getPeaje(listaPeajes[index].idPeaje);
                    total = total + temp.categoriaII
                }
                break;
            case 3:
                for (let index = 0; index < listaPeajes.length; index++) {
                    const temp: any = await this.peaje.getPeaje(listaPeajes[index].idPeaje);
                    total = total + temp.categoriaIII
                }
                break;
            case 4:
                for (let index = 0; index < listaPeajes.length; index++) {
                    const temp: any = await this.peaje.getPeaje(listaPeajes[index].idPeaje);
                    total = total + temp.categoriaIV
                }
                break;
            case 5:
                for (let index = 0; index < listaPeajes.length; index++) {
                    const temp: any = await this.peaje.getPeaje(listaPeajes[index].idPeaje);
                    total = total + temp.categoriaV
                }
                break;
            default:
                break;
        }
        return total;
    }
    public calcularVariables(items: any, kms: number, peso: number) {
        let llantas = 0
        let lubricantes = 0
        let filtros = 0
        let mantenimiento = 0
        let lavado = 0
        for (let index = 0; index < items.length; index++) {
            const element = items[index].idParametroItemVariable;
            switch (element) {
                case 1:
                    llantas = llantas + (items[index].nuevocCostoItem * kms)
                    break;
                case 2:
                    lubricantes = lubricantes + (items[index].nuevocCostoItem * kms)
                    break;
                case 3:
                    filtros = filtros + (items[index].nuevocCostoItem * kms)
                    break;
                case 4:
                    mantenimiento = mantenimiento + (items[index].nuevocCostoItem * kms)
                    break;
                case 5:
                    lavado = lavado + (items[index].nuevocCostoItem * kms)
                    break;
                default:
                    break;
            }
        }
        return { 'llantas': [llantas, llantas / peso], 'lubricantes': [lubricantes, lubricantes / peso], 'filtros': [filtros, filtros / peso], 'mantenimiento': [mantenimiento, mantenimiento / peso], 'lavado': [lavado, lavado / peso] }
    }
    public async calcular(configuracion: number, origen: string, destino: string, horas: number) {
        const idO: number = await this.ciudad.ciudadNombre(origen);
        const idD: number = await this.ciudad.ciudadNombre(destino);
        //console.log(idO,idD)
        const ruta: any = await this.ruta.getRutas(idO, idD);
        //console.log(ruta);
        const config: any = await this.configuracion.configuracion(configuracion);
        const idVehiculo = await config.idVehiculoConfiguracion;
        const infoVahiculo = await this.vehiculo.vehiculoInfo(1);
        //console.log(infoVahiculo)
        //console.log(idVehiculo);
        const velocidades: any = await this.velocidades.velocidadVehiculo(idVehiculo);
        //console.log(velocidades);
        const horasViaje: number[] = await this.horasViaje(ruta, velocidades, horas);
        //console.log(horasViaje[2]);
        const fijosViaje: any = await this.fijos.Getfijos(configuracion)
        //console.log(fijosViaje[0].nuevoValorItem)
        const valoresFijos: any = await this.calcularFijos(fijosViaje, horasViaje[2], infoVahiculo[0].pesoVehiculo)
        //console.log(valoresFijos);
        const consumop: any = await this.consumos.getConsumos(idVehiculo)
        const costoCombustible: number = await this.combustible(ruta, consumop);
        //console.log(costoCombustible)
        const rutapeaje: any = await this.rutapeaje.getRutaPeaje(ruta.idRuta)
        //console.log(rutapeaje)
        const costoPeaje: number = await this.peajes(rutapeaje, infoVahiculo[0].categoriaVehiculo)
        //console.log(costoPeaje)
        const itemsVariables = await this.variables.getVariables(configuracion);
        const costoVariables: any = await this.calcularVariables(itemsVariables, 399.8, infoVahiculo[0].pesoVehiculo)
        //console.log(costoVariables)
        let totalFijos = 0
        for (let index = 0; index < valoresFijos.valoresViaje.length; index++) {
            const element = valoresFijos.valoresViaje[index];
            totalFijos = totalFijos + element
        }
        const imprevistos = 0.075 * (costoVariables.llantas[0] + costoVariables.lubricantes[0] + costoVariables.filtros[0] + costoVariables.mantenimiento[0] + costoVariables.lavado[0])
        //console.log(imprevistos)
        const subtotalVariables = imprevistos + costoVariables.llantas[0] + costoVariables.lubricantes[0] + costoVariables.filtros[0] + costoVariables.mantenimiento[0] + costoVariables.lavado[0] + costoPeaje + costoCombustible
        //console.log(subtotalVariables);
        const comisiones = (subtotalVariables + totalFijos) * 0.124552
        const admin = (subtotalVariables + totalFijos) * 0.05
        const ica = (subtotalVariables + totalFijos) * 0.013
        const otos = (comisiones + admin + ica)
        const totalopercaion = subtotalVariables + totalFijos + otos
        //console.log(ruta.planoRuta)
        const costoTiempoEspera: number = config.costoHoraAdicional * horas
        const costoMovil: number = totalopercaion - costoTiempoEspera
        const costoTonmovil: number = costoMovil / infoVahiculo[0].pesoVehiculo
        const costoTonKm: number = costoTonmovil / (ruta.planoRuta + ruta.onduladoRuta + ruta.montanaRuta + ruta.urbanoRuta + ruta.despavimentadoRuta)
        const costoTonViaje: number = totalopercaion / infoVahiculo[0].pesoVehiculo
        const costoKmViaje: number = totalopercaion / (ruta.planoRuta + ruta.onduladoRuta + ruta.montanaRuta + ruta.urbanoRuta + ruta.despavimentadoRuta)
        const costoTonKmViaje: number = costoTonViaje / (ruta.planoRuta + ruta.onduladoRuta + ruta.montanaRuta + ruta.urbanoRuta + ruta.despavimentadoRuta)
        const costoKmMovil: number = costoMovil / (ruta.planoRuta + ruta.onduladoRuta + ruta.montanaRuta + ruta.urbanoRuta + ruta.despavimentadoRuta)
        //console.log(costoKmMovil);
        return {
            'resumen': [
                {
                    'costoTotalViaje': totalopercaion,
                    'costoTiempoEspera': costoTiempoEspera,
                    'costoMovilizacionCarga': costoMovil,
                    'horasEspera': horas,
                    'costoHoraAdicional': config.costoHoraAdicional,
                    'costoToneladaMovilizacion': costoTonmovil,
                    'costoTonKmMovilizacion': costoTonKm,
                    'costoToneladaViaje': costoTonViaje,
                    'costotoneladaKmViaje': costoTonKmViaje,
                    'costoKmViaje': costoKmViaje,
                    'costoKmMovilizacion': costoKmMovil
                }
            ]
        }

    }
}
export default calculo;