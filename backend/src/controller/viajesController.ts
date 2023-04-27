import { Request, Response, json } from 'express';
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
class viajesController {
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
    public registerViaje = async (req: Request, res: Response) => {
        await this.flete.registroFlete(req.body.toneladaKilometro, req.body.costoTonelada, req.body.costocarga, req.body.costoHoraadicional, req.body.horasEspera, req.body.costoTiempoEspera, req.body.toneladaKilometroViaje, req.body.toneladaViaje, req.body.costoKilometro, req.body.costoKilometroViaje, (error: any) => {
            if (error) {
                return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
            }
        });
        await this.viaje.registroViaje(req.body.idUsuario, req.body.nombre, req.body.origen, req.body.destino, req.body.estado, (error: any) => {
            if (error) {
                return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
            }
        });
        return res.status(200).json({ error: false, message: 'Algo ha salido bien al realizar el registro!' });
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
            await this.viaje.cambiarEstado(req.body.idViaje, req.body.estado,(error: any) => {
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
            await this.viaje.asignarConductor(req.body.idViaje, req.body.idConductor,(error: any) => {
                if (error) {
                    return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
                }
            });
        } else {
            return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
        }
        return res.status(200).json({ error: false, message: 'Algo ha salido bien al realizar el registro!' });
    }
}
export default viajesController;