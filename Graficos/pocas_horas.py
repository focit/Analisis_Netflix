import matplotlib.pyplot as plt
import json

# JSON proporcionado
data_json = '''
[
  {
    "disponibilidad_mundial": "No disponible mundialmente",
    "titulos_bajo_desempeño": "9722",
    "porcentaje": "81.74"
  },
  {
    "disponibilidad_mundial": "Disponible mundialmente",
    "titulos_bajo_desempeño": "2172",
    "porcentaje": "18.26"
  }
]
'''

# Convertir JSON a lista de diccionarios
data = json.loads(data_json)

# Extraer los datos relevantes
disponibilidad = [item['disponibilidad_mundial'] for item in data]
porcentajes = [float(item['porcentaje']) for item in data]

# Crear el gráfico de pastel
plt.figure(figsize=(8, 8))
plt.pie(porcentajes, labels=disponibilidad, autopct='%1.1f%%', startangle=140, colors=['#66b3ff','#99ff99'])

# Añadir título
plt.title('Distribución del contenido con bajo desempeño (menos horas vistas) por su disponibilidad mundial en Netflix en 2023')

# Mostrar el gráfico
plt.show()