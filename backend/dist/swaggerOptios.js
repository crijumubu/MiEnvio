"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.options = void 0;
exports.options = {
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
    apis: ['./routes/*.js'],
};
