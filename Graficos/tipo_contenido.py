import matplotlib.pyplot as plt
import json

# JSON proporcionado
data_json = '''
[
  {
    "tipo_de_contenido": "Serie",
    "total_horas_vistas": "107764100000",
    "pct_total": "68.03"
  },
  {
    "tipo_de_contenido": "Película",
    "total_horas_vistas": "50637800000",
    "pct_total": "31.97"
  }
]
'''

# Convertir JSON a lista de diccionarios
data = json.loads(data_json)

# Extraer los datos relevantes
tipos = [item['tipo_de_contenido'] for item in data]
porcentajes = [float(item['pct_total']) for item in data]

# Crear el gráfico de pastel
plt.figure(figsize=(8, 8))
plt.pie(porcentajes, labels=tipos, autopct='%1.1f%%', startangle=140, colors=['#66b3ff','#99ff99'])

# Añadir título
plt.title('Distribución de horas vistas por el tipo de contenido de Netflix en 2023')

# Mostrar el gráfico
plt.show()