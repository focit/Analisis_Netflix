import matplotlib.pyplot as plt
import json

# JSON proporcionado
data_json = '''
[
  {
    "idioma": "Inglés",
    "total_de_horas": "124441700000",
    "pct_de_horas": "78.56"
  },
  {
    "idioma": "Coreano",
    "total_de_horas": "15378400000",
    "pct_de_horas": "9.71"
  },
  {
    "idioma": "No-Inglés",
    "total_de_horas": "10439100000",
    "pct_de_horas": "6.59"
  },
  {
    "idioma": "Japonés",
    "total_de_horas": "7102000000",
    "pct_de_horas": "4.48"
  },
  {
    "idioma": "Hindi",
    "total_de_horas": "926100000",
    "pct_de_horas": "0.58"
  },
  {
    "idioma": "Ruso",
    "total_de_horas": "114600000",
    "pct_de_horas": "0.07"
  }
]
'''

# Convertir JSON a lista de diccionarios
data = json.loads(data_json)

# Extraer los datos relevantes
idiomas = [item['idioma'] for item in data]
porcentajes = [float(item['pct_de_horas']) for item in data]

# Crear el gráfico de barras
plt.figure(figsize=(10, 6))
bars = plt.bar(idiomas, porcentajes, color='skyblue')

# Añadir etiquetas con los porcentajes
for bar in bars:
    height = bar.get_height()
    plt.text(bar.get_x() + bar.get_width() / 2, height, f'{height:.2f}%', ha='center', va='bottom')

# Añadir título y etiquetas de ejes
plt.title('Distribución de las horas vistas del contenido de Netflix por idioma en 2023')

# Rotar las etiquetas del eje X para mejor legibilidad
plt.xticks(rotation=45, ha='right')

# Mostrar el gráfico
plt.tight_layout()
plt.show()