from flask import Blueprint, render_template

# Create a blueprint named 'routes'
routes = Blueprint('routes', __name__)

@routes.route('/')
def home():
    return render_template('home.html')
