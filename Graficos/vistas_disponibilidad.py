import matplotlib.pyplot as plt
import json

# JSON proporcionado
data_json = '''
[
  {
    "disponibilidad_mundial": "Disponibilidad mundial",
    "cantidad_programas": "7650",
    "total_horas": "85263000000",
    "promedio_horas": "11145490.20"
  },
  {
    "disponibilidad_mundial": "Sin disponibilidad mundial",
    "cantidad_programas": "17162",
    "total_horas": "73138900000",
    "promedio_horas": "4261676.96"
  }
]
'''

# Convertir JSON a lista de diccionarios
data = json.loads(data_json)

# Extraer los datos relevantes
disponibilidad = [item['disponibilidad_mundial'] for item in data]
promedio = [float(item['promedio_horas']) / 1e9 for item in data]  # Convertir a miles de millones

# Crear el gráfico de barras
plt.figure(figsize=(10, 6))
bars = plt.bar(disponibilidad, promedio, color='skyblue')

# Añadir título y etiquetas de ejes
plt.title('Diferencia del promedio de horas vistas del contenido de Netflix por su distribución mundial en 2023')
plt.ylabel('Promedio de horas vistas (en miles de millones)')

# Rotar las etiquetas del eje X para mejor legibilidad
plt.xticks(rotation=0, ha='right')

# Mostrar el gráfico
plt.tight_layout()
plt.show()