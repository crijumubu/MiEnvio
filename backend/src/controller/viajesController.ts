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




class viajesController {
    private ruta: rutaModel;
    private ciudad: ciudadModel;
    private configuracion: configuracionModel;
    private consumo: promedioConsumoModel;
    private velocidad: promedioVelocidadModel;
    private carga: tipoCargaModel;
    private parametro: tipoParametroCostoVariableModel;
    private unidad: tipoUnidadModel;
    private vehiculo: tipoVehiculoModel;
    private peaje :peajeModel;
    private costoFijo :costoFijoModel;
    private costoVariable: costoVariableModel;
    private rutaPeaje: rutaPeajeModel;
    
    constructor() {
        this.rutaPeaje= new rutaPeajeModel();
        this.ruta= new rutaModel();
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
        data='';
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
    public getPeajeId = (req: Request, res: Response)=>{
        this.peaje.optenerPeaje(Number(req.params.id),( row:any)=>{
            console.log(row);
            if(row){
                
                res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }

        });
    }
    public getFijosId = (req: Request, res: Response)=>{
        this.costoFijo.obtenerCostosFijos(Number(req.params.id),( row:any)=>{
            if(row){
            res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }

        });
    }
    public getVariablesId = (req: Request, res: Response)=>{
        this.costoVariable.obtenerCostosVariables(Number(req.params.id),( row:any)=>{
            if(row){
            
            res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }

        });
    }
    public getRutaOriDet = (req: Request, res: Response)=>{
        this.ruta.obtenerRutas(Number(req.params.idOrigen),Number(req.params.idDestino),( row:any)=>{
            if(row){
            
            res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }

        });
    }
    public getRutaPeajeId = (req: Request, res: Response)=>{
        this.rutaPeaje.obtenerRutaPeaje(Number(req.params.id),( row:any)=>{
            if(row){
            
            res.json(row);
            }
            else {
                return res.status(404).json({ error: true, message: 'User not found' });
            }

        });
    }
}
export default viajesController;