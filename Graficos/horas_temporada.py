import matplotlib.pyplot as plt
import json

# JSON proporcionado
data_json = '''
[
  {
    "numero": 1,
    "temporada": "Primavera",
    "total_horas": "21812400000"
  },
  {
    "numero": 2,
    "temporada": "Verano",
    "total_horas": "22482300000"
  },
  {
    "numero": 3,
    "temporada": "Otoño",
    "total_horas": "20604800000"
  },
  {
    "numero": 4,
    "temporada": "Invierno",
    "total_horas": "25928500000"
  }
]
'''

# Convertir JSON a lista de diccionarios
data = json.loads(data_json)

# Extraer los datos relevantes
temporada = [item['temporada'] for item in data]
horas = [float(item['total_horas']) for item in data]

# Crear el gráfico de barras
plt.figure(figsize=(10, 6))
bars = plt.bar(temporada, horas, color='green')

# Añadir título
plt.title('El total de horas vistas del contenido de Netflix por temporada del año en 2023')

# Rotar las etiquetas del eje X para mejor legibilidad
plt.xticks(rotation=45, ha='right')

# Mostrar el gráfico
plt.tight_layout()
plt.show()