import * as misFunciones from './modulos/funciones'

describe('Pruebas relacionadas a los usuarios', () => {
  test('Login', async() => {
    var rta = await misFunciones.login("conductor@mail.co","1234")
    expect(rta).toBe(false);
  });
  
  test('RegistroJuan', async() => {
    var rta = await misFunciones.Registro("Juan","conductorJuan@mail.co","1234","2")
    expect(rta).toBe(false);
  });

  test('RegistroSofia', async() => {
    var rta = await misFunciones.Registro("Sofia","Sofia@gmail.com","98sudi","1")
    expect(rta).toBe(false);
  });
  
  test('Actualizar datos de persona', async() => {
    var rta = await misFunciones.actualizar_datos(2,"carro","conductor@mail.com","1234")
    expect(rta).toBe(false);
  });

  test('Actualizar datos de persona', async() => {
    var rta = await misFunciones.actualizar_datos(30,"Sofia","Sofia@gmail.com","98sudi")
    expect(rta).toBe(false);
  });

  test('Actualizar datos de persona', async() => {
    var rta = await misFunciones.actualizar_datos(29,"Juan","conductorJuan@mail.co","1234")
    expect(rta).toBe(false);
  });
});

describe('Pruebas relacionadas a la logistica de los viajes/fletes', () => {
  test('Registrar viaje', async() => {
    var rta = await misFunciones.registrarviaje()
    expect(rta).toBe(false);
  });
  
  test('Cambiar el estado del viaje', async() => {
    var rta = await misFunciones.cambiarestadoviaje()
    expect(rta).toBe(false);
  });
  
  test('Obtener viaje por ID', async() => {
    var rta = await misFunciones.obtenerviajeid()
    expect(rta).toBe(2);
  });
  
  test('Obtener informacion pedaje', async() => {
    var rta = await misFunciones.obtenerpedaje()
    expect(rta).toBe("casablanca");
  });
  
  test('Obtener costos fijos', async() => {
    var rta = await misFunciones.obtenercostosfijos()
    expect(rta).toBe("capital");
  });
  
  test('registro flete', async() => {
    var rta = await misFunciones.registroflete()
    expect(rta).toBe(false);
  });

  test('Viajes activos por usuario', async() => {
    var pls
    var rta = await misFunciones.viajesusuarioactivo()
    var lon = rta.length
    if(lon >= 1){
      pls = true
    }else{
      pls = false
    }
    expect(pls).toBe(true);
  });

  test('Detalles al viaje', async() => {
    var rta = await misFunciones.registrodetalle()
    expect(rta).toBe(false);
  });

  test('Ruta origen - Final', async() => {
    var rta = await misFunciones.rutaorigenfinal()
    expect(rta).toBe(20);
  });

  test('Ver flete', async() => {
    var rta = await misFunciones.verflete()
    expect(rta).toBe(1111);
  });
});


