#!/usr/bin/env python3

import connexion

from livereload import Server
from swagger_server import encoder


def main():
    app = connexion.App(__name__, specification_dir='./swagger/')
    app.app.json_encoder = encoder.JSONEncoder
    app.add_api('swagger.yaml', arguments={'title': 'Swagger Petstore'}, pythonic_params=True)
    server = Server(app.app.wsgi_app)
    server.serve(host='0.0.0.0')

if __name__ == '__main__':
    main()