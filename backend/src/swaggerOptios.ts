export const options = {
    swaggerDefinition: {
      openapi: '3.0.0',
      info: {
        title: 'MEnvio API',
        version: '1.0.0',
        description: 'Doumentación de los enpoints de la API del Backend del sistema MIEnvio',
      },
      servers: [
        {
          url: 'http://localhost:1802',
        },
      ],
    },
    apis: ['dist/routes/*.js'],
    
  };