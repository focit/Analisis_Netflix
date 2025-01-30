import matplotlib.pyplot as plt
import json

# JSON proporcionado
data_json = '''
[
  {
    "idioma": "Coreano",
    "promedio_horas_vistas": "9720859.67"
  },
  {
    "idioma": "Inglés",
    "promedio_horas_vistas": "7206491.78"
  },
  {
    "idioma": "No-Inglés",
    "promedio_horas_vistas": "3210055.35"
  },
  {
    "idioma": "Japonés",
    "promedio_horas_vistas": "3091858.95"
  },
  {
    "idioma": "Ruso",
    "promedio_horas_vistas": "2938461.54"
  },
  {
    "idioma": "Hindi",
    "promedio_horas_vistas": "2476203.21"
  }
]
'''

# Convertir JSON a lista de diccionarios
data = json.loads(data_json)

# Extraer los datos relevantes
idiomas = [item['idioma'] for item in data]
promedio = [float(item['promedio_horas_vistas']) for item in data]

# Crear el gráfico de barras
plt.figure(figsize=(10, 6))
bars = plt.bar(idiomas, promedio, color='skyblue')

# Añadir título y etiquetas de ejes
plt.title('Distribución del promedio de horas vistas del contenido de Netflix por idioma en 2023')

# Rotar las etiquetas del eje X para mejor legibilidad
plt.xticks(rotation=45, ha='right')

# Mostrar el gráfico
plt.tight_layout()
plt.show()