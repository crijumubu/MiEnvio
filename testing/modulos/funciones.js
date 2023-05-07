//Login
export async function login(email,password) {
    var data = {
        "email":email,
        "password": password
    }
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    const rss = await resultado.json()
    return rss["error"]
}

//Registro
export async function Registro(nombre,correo,contra,tipo) {
    var data = {
        "name": nombre,
        "email": correo,
        "password": contra,
        "userType": tipo
    }
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    const rss = await resultado.json()
    return rss["error"]
}

// Información personal 
export async function informacion_personal() {
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/getDataUser/1', {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    const rss = await resultado.json()
    return rss[0]["name"].toLowerCase()
}

// Actualizar datos 
export async function actualizar_datos(id,nombre,correo,contrasena) {
    const data = {
        "id":id,
        "name":nombre,
        "email":correo,
        "password":contrasena
    }
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/updateUser', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    const rss = await resultado.json()
    return rss["error"]
}

// Registrar viaje 
export async function registrarviaje() {
    var data = {
        "idUsuario":1, 
        "nombre":"Viaje2", 
        "origen":"Bogota", 
        "destino":"Bucaramanga", 
        "estado":1,
        "direccion":"Autopista Piedecuesta Kilómetro 7,, Floridablanca, Santander"
    }
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/registroViaje', {
        method: 'post',
        headers: {
            'Content-Type': 'application/json'
        },
        body : JSON.stringify(data)
    })
    const rss = await resultado.json()
    return rss["error"]
}

// Cambiar estado viaje
export async function cambiarestadoviaje() {
    var data = {
        "idViaje": 1,
        "estado": 2
    }
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/cambioEstados', {
        method: 'post',
        headers: {
            'Content-Type': 'application/json'
        },
        body : JSON.stringify(data)
    })
    const rss = await resultado.json()
    return rss["error"]
}

//Obtener viaje por id
export async function obtenerviajeid() {
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/viajeId/1', {
        method: 'get',
        headers: {
            'Content-Type': 'application/json'
        },
    })
    const rss = await resultado.json()
    return rss[0]["estado"]
}

//Obtener Info Pedaje
export async function obtenerpedaje() {
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/peaje/1', {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        },
    })
    const rss = await resultado.json()
    return ((rss[0]["nombrePeaje"]).toLowerCase())
}

//Obtener Costos fijos
export async function obtenercostosfijos() {
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/costoFijo/1', {
        method: 'get',
        headers: {
            'Content-Type': 'application/json'
        },
    })
    const rss = await resultado.json()
    return rss[0]["nombreItemFijo"].toLowerCase()
}

// Registrar flete 
export async function registroflete() {
    var data = {
        "idViaje":1,
        "toneladaKilometro":7878, 
        "costoTonelada":7878, 
        "costocarga":7878, 
        "costoHoraadicional":7878, 
        "horasEspera":7878, 
        "costoTiempoEspera":7878, 
        "toneladaKilometroViaje":7878, 
        "toneladaViaje":7878, 
        "costoKilometro":7878, 
        "costoKilometroViaje":7878
        }
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/registroFlete', {
        method: 'post',
        headers: {
            'Content-Type': 'application/json'
        },
        body : JSON.stringify(data)
    })
    const rss = await resultado.json()
    return rss["error"]
}

// Ver viajes activos usuario 
export async function viajesusuarioactivo() {
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/viajeIdUsrActivo/1', {
        method: 'get',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    const rss = await resultado.json()
    return rss
}

// Registrar detalles
export async function registrodetalle() {
    var data = {
        "idFlete":1,
        "tipoCosto":3, 
        "concepto":"prueba", 
        "mes":7878, 
        "viaje":7878, 
        "tonelada":7878, 
        "participacion":7878
    }
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/registroDetalles', {
        method: 'post',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    const rss = await resultado.json()
    return rss["error"]
}

// Ruta - Origen - Final
export async function rutaorigenfinal() {
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/ruta/1/2', {
        method: 'get',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    const rss = await resultado.json()
    return rss[0]["urbanoRuta"]
}

// verflete
export async function verflete() {
    const resultado = await fetch('http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/fleteId/2', {
        method: 'get',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    const rss = await resultado.json()
    return rss[0]["toneladaKilometro"]
}
