import { Request, Response, json } from 'express';
import ciudadModel from '../model/ciudadModel';
import configuracionModel from '../model/configuracionModel';
import promedioConsumoModel from '../model/promedioConsumoModel';
import promedioVelocidadModel from '../model/promedioVelocidadModel';
import tipoCargaModel from '../model/tipoCargaModel';
import tipoParametroCostoVariableModel from '../model/tipoParametroCostoVariable';
import tipoUnidadModel from '../model/tipoUnidadModel';
import tipoVehiculoModel from '../model/tipoVehiculoModel';
class viajesController {
    private ciudad: ciudadModel;
    private configuracion: configuracionModel;
    private consumo: promedioConsumoModel;
    private velocidad: promedioVelocidadModel;
    private carga: tipoCargaModel;
    private parametro: tipoParametroCostoVariableModel;
    private unidad: tipoUnidadModel;
    private vehiculo: tipoVehiculoModel;
    constructor() {
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
        data='';
        await this.ciudad.obtenerCiudades((row: any) => {
            if (row) {
                data = data + '{"ciudades":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: false, message: 'User not found' });
            }
        });
        await this.vehiculo.obtenerVehiculos((row: any) => {
            if (row) {
                data = data + '"vehiculos":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: false, message: 'User not found' });
            }
        });
        await this.carga.obtenerCargas((row: any) => {
            if (row) {
                data = data + '"cargas":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: false, message: 'User not found' });
            }
        });
        await this.unidad.obtenerUnidades((row: any) => {
            if (row) {
                data = data + '"unidades":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: false, message: 'User not found' });
            }
        });
        await this.configuracion.obtenerConfiguraciones((row: any) => {
            if (row) {
                data = data + '"configuraciones":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: false, message: 'User not found' });
            }
        });
        await this.velocidad.obtenerVelocidades((row: any) => {
            if (row) {
                data = data + '"velocidades":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: false, message: 'User not found' });
            }
        });
        await this.consumo.obtenerConsumos((row: any) => {
            if (row) {
                data = data + '"consumos":' + JSON.stringify(row) + ',';
            }
            else {
                return res.status(404).json({ error: false, message: 'User not found' });
            }
        });
        await this.parametro.obtenerParametros((row: any) => {
            if (row) {
                data = data + '"parametros":' + JSON.stringify(row) + '}';
                res.json(JSON.parse(data.toString()));
                //console.log(data);
            }
            else {
                return res.status(404).json({ error: false, message: 'User not found' });
            }
        });
    }
}
export default viajesController;