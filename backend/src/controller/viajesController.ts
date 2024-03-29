import { Request, Response, application, json } from 'express';
import ciudadModel from '../model/ciudadModel';
import configuracionModel from '../model/configuracionModel';
import promedioConsumoModel from '../model/promedioConsumoModel';
import promedioVelocidadModel from '../model/promedioVelocidadModel';
import tipoCargaModel from '../model/tipoCargaModel';
import tipoParametroCostoVariableModel from '../model/tipoParametroCostoVariable';
import tipoUnidadModel from '../model/tipoUnidadModel';
import tipoVehiculoModel from '../model/tipoVehiculoModel';
import peajeModel from '../model/peajeModel';
import costoFijoModel from '../model/costoFijoModel';
import costoVariableModel from '../model/costoVariableModel';
import rutaModel from '../model/rutaModel';
import rutaPeajeModel from '../model/rutapeajeModel';
import fleteModel from '../model/fleteModel';
import detalleModel from '../model/detalleModel';
import viajeModel from '../model/viajeModel';
import calculo from '../model/calculo';
calculo
class viajesController {
    private calculadora: calculo;
    private viaje: viajeModel;
    private detalle: detalleModel;
    private flete: fleteModel;
    private ruta: rutaModel;
    private ciudad: ciudadModel;
    private configuracion: configuracionModel;
    private consumo: promedioConsumoModel;
    private velocidad: promedioVelocidadModel;
    private carga: tipoCargaModel;
    private parametro: tipoParametroCostoVariableModel;
    private unidad: tipoUnidadModel;
    private vehiculo: tipoVehiculoModel;
    private peaje: peajeModel;
    private costoFijo: costoFijoModel;
    private costoVariable: costoVariableModel;
    private rutaPeaje: rutaPeajeModel;
    constructor() {
        this.calculadora = new calculo();
        this.detalle = new detalleModel();
        this.viaje = new viajeModel();
        this.flete = new fleteModel();
        this.rutaPeaje = new rutaPeajeModel();
        this.ruta = new rutaModel();
        this.costoVariable = new costoVariableModel();
        this.costoFijo = new costoFijoModel();
        this.peaje = new peajeModel();
        this.ciudad = new ciudadModel();
        this.configuracion = new configuracionModel();
        this.consumo = new promedioConsumoModel();
        this.velocidad = new promedioVelocidadModel();
        this.carga = new tipoCargaModel();
        this.parametro = new tipoParametroCostoVariableModel();
        this.unidad = new tipoUnidadModel();
        this.vehiculo = new tipoVehiculoModel();
    }
    public dataInicio = async (req: Request, res: Response) => {
        let data: string;
        data = '';
        await this.ciudad.obtenerCiudades((row: any) => {
            if (row) {
                data = data + '{"ciudades":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
        await this.vehiculo.obtenerVehiculos((row: any) => {
            if (row) {
                data = data + '"vehiculos":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
        await this.carga.obtenerCargas((row: any) => {
            if (row) {
                data = data + '"cargas":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
        await this.unidad.obtenerUnidades((row: any) => {
            if (row) {
                data = data + '"unidades":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
        await this.configuracion.obtenerConfiguraciones((row: any) => {
            if (row) {
                data = data + '"configuraciones":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
        await this.velocidad.obtenerVelocidades((row: any) => {
            if (row) {
                data = data + '"velocidades":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
        await this.consumo.obtenerConsumos((row: any) => {
            if (row) {
                data = data + '"consumos":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
        await this.parametro.obtenerParametros((row: any) => {
            if (row) {
                data = data + '"parametros":' + JSON.stringify(row) + '}';
                res.json(JSON.parse(data.toString()));
                //console.log(data);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public getPeajeId = (req: Request, res: Response) => {
        this.peaje.optenerPeaje(Number(req.params.id), (row: any) => {
            console.log(row);
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public getFijosId = (req: Request, res: Response) => {
        this.costoFijo.obtenerCostosFijos(Number(req.params.id), (row: any) => {
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public getVariablesId = (req: Request, res: Response) => {
        this.costoVariable.obtenerCostosVariables(Number(req.params.id), (row: any) => {
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public getRutaOriDet = (req: Request, res: Response) => {
        this.ruta.obtenerRutas(Number(req.params.idOrigen), Number(req.params.idDestino), (row: any) => {
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public getRutaPeajeId = (req: Request, res: Response) => {
        this.rutaPeaje.obtenerRutaPeaje(Number(req.params.id), (row: any) => {
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public getFlete = (req: Request, res: Response) => {
        this.flete.obtenerFleteId(Number(req.params.id), (row: any) => {
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public getFleteViaje = (req: Request, res: Response) => {
        this.flete.obtenerFleteIdViaje(Number(req.params.id), (row: any) => {
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public getDetalle = (req: Request, res: Response) => {
        this.detalle.obtenerDetallesIdFlete(Number(req.params.id), (row: any) => {
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public getViaje = (req: Request, res: Response) => {
        this.viaje.obtenerViajeIdUser(Number(req.params.id), (row: any) => {
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public registerDetalle = async (req: Request, res: Response) => {
        if (req.body) {
            await this.detalle.registroDetalles(req.body.idFlete, req.body.tipoCosto, req.body.concepto, req.body.mes, req.body.viaje, req.body.tonelada, req.body.participacion, (error: any) => {
                if (error) {
                    return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
                }
            });
        } else {
            return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
        }
        return res.status(200).json({ error: false, message: 'Algo ha salido bien al realizar el registro!' });
    }
    public updateEstado = async (req: Request, res: Response) => {
        if (req.body) {
            await this.viaje.cambiarEstado(req.body.idViaje, req.body.estado, (error: any) => {
                if (error) {
                    return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
                }
            });
        } else {
            return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
        }
        return res.status(200).json({ error: false, message: 'Algo ha salido bien al realizar el registro!' });
    }
    public asignarConductor = async (req: Request, res: Response) => {
        if (req.body) {
            await this.viaje.asignarConductor(req.body.idViaje, req.body.idConductor, (error: any) => {
                if (error) {
                    return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
                }
            });
        } else {
            return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
        }
        return res.status(200).json({ error: false, message: 'Algo ha salido bien al realizar el registro!' });
    }
    public getViajeActivo = (req: Request, res: Response) => {
        this.viaje.obtenerViajeActivo(Number(req.params.id), (row: any) => {
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public getViajeConductor = (req: Request, res: Response) => {
        this.viaje.obtenerViajeCondustor(Number(req.params.id), (row: any) => {
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public getViajeId = (req: Request, res: Response) => {
        this.viaje.obtenerViajeId(Number(req.params.id), (row: any) => {
            if (row) {
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }
        });
    }
    public registerViaje = async (req: Request, res: Response) => {
        const { idUsuario, nombre, origen, destino, estado, direccion } = req.body;
        await this.viaje.registroViaje(idUsuario, nombre, origen, destino, estado, direccion, (error: any, id: number) => {
            if (!error) {
                return res.json({ error: false, message: 'Registro  exitóso!', idViaje: id });
            }
            else {
                return res.json({ error: true, message: 'Algo ha salido mal al realizar el registro!' });
            }
        });
    }
    public registerFlete = async (req: Request, res: Response) => {
        const { idViaje, toneladaKilometro, costoTonelada, costocarga, costoHoraadicional, horasEspera, costoTiempoEspera, toneladaKilometroViaje, toneladaViaje, costoKilometro, costoKilometroViaje } = req.body;
        await this.flete.registroFlete(idViaje, toneladaKilometro, costoTonelada, costocarga, costoHoraadicional, horasEspera, costoTiempoEspera, toneladaKilometroViaje, toneladaViaje, costoKilometro, costoKilometroViaje, (error: any) => {
            if (!error) {
                return res.json({ error: false, message: 'Registro  exitóso!' });
            }
            else {
                return res.json({ error: true, message: 'Algo ha salido mal al realizar el registro!' });
            }
        });
    }
    public calcularViaje = async (req: Request, res: Response) => {
        const { configuracion, ciudadOrigen, ciudadDestino, horasEspera } = req.body;
        try {
            const data: any = await this.calculadora.calcular(configuracion, ciudadOrigen, ciudadDestino, horasEspera);
            return res.json(data)
        }
        catch (e) {
            console.log(e)
            return res.status(404).json({ error: true, message: 'User not found' });
        }

    }
}
export default viajesController;