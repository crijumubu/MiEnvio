module.exports = {
  // otras configuraciones de Jest
  reporters: [
    "default",
    ["jest-html-reporter", {
      "pageTitle": "Pruebas de la API de MiEnvio",
      "outputPath": "test-report.html",
      "includeFailureMsg": true,
      "screenshots": {
        "enabled": true,
        "path": "test-screenshots",
        "takeOnFails": true
      }
    }]
  ]
};
