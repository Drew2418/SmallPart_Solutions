from flask import Flask

def create_app():
    application = Flask(__name__)
    application.config['SECRET_KEY'] = 'secret1'

    from .views import routes  # Import the blueprint
    application.register_blueprint(routes)

    return application