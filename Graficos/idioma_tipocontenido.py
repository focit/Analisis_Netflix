import matplotlib.pyplot as plt
import numpy as np
import json

# JSON proporcionado
data_json = '''
[
  {
    "tipo_de_contenido": "Serie",
    "idioma": "Inglés",
    "total_de_horas": "88140800000"
  },
  {
    "tipo_de_contenido": "Película",
    "idioma": "Inglés",
    "total_de_horas": "36300900000"
  },
  {
    "tipo_de_contenido": "Serie",
    "idioma": "Coreano",
    "total_de_horas": "7792600000"
  },
  {
    "tipo_de_contenido": "Película",
    "idioma": "Coreano",
    "total_de_horas": "7585800000"
  },
  {
    "tipo_de_contenido": "Serie",
    "idioma": "No-Inglés",
    "total_de_horas": "6847600000"
  },
  {
    "tipo_de_contenido": "Serie",
    "idioma": "Japonés",
    "total_de_horas": "4572500000"
  },
  {
    "tipo_de_contenido": "Película",
    "idioma": "No-Inglés",
    "total_de_horas": "3591500000"
  },
  {
    "tipo_de_contenido": "Película",
    "idioma": "Japonés",
    "total_de_horas": "2529500000"
  },
  {
    "tipo_de_contenido": "Película",
    "idioma": "Hindi",
    "total_de_horas": "604900000"
  },
  {
    "tipo_de_contenido": "Serie",
    "idioma": "Hindi",
    "total_de_horas": "321200000"
  },
  {
    "tipo_de_contenido": "Serie",
    "idioma": "Ruso",
    "total_de_horas": "89400000"
  },
  {
    "tipo_de_contenido": "Película",
    "idioma": "Ruso",
    "total_de_horas": "25200000"
  }
]
'''

# Convertir JSON a lista de diccionarios
data = json.loads(data_json)

# Extraer los datos relevantes
idiomas = sorted(list(set(item['idioma'] for item in data)))  # Lista única de idiomas
tipos = sorted(list(set(item['tipo_de_contenido'] for item in data)))  # Lista única de tipos de contenido

# Crear una matriz para almacenar los totales de horas
horas = {tipo: [0] * len(idiomas) for tipo in tipos}  # Inicializar con ceros

# Llenar la matriz con los datos
for item in data:
    idioma_index = idiomas.index(item['idioma'])
    tipo = item['tipo_de_contenido']
    horas[tipo][idioma_index] = int(item['total_de_horas']) / 1e9  # Convertir a miles de millones

# Crear el gráfico de barras agrupadas
x = np.arange(len(idiomas))  # Posiciones en el eje X
width = 0.35  # Ancho de las barras

fig, ax = plt.subplots(figsize=(12, 6))

# Dibujar las barras para cada tipo de contenido
for i, tipo in enumerate(tipos):
    ax.bar(x + i * width, horas[tipo], width, label=tipo)

# Añadir etiquetas con los valores de las barras
for i, idioma in enumerate(idiomas):
    for j, tipo in enumerate(tipos):
        valor = horas[tipo][i]
        ax.text(x[i] + j * width, valor + 0.1, f'{valor:.1f}B', ha='center', va='bottom', fontsize=8)

# Añadir título y etiquetas de ejes
ax.set_title('Distribución de las horas vistas por tipo de contenido e idioma en Netflix en 2023')
ax.set_ylabel('Total de horas vistas (en miles de millones)')
ax.set_xticks(x + width / 2)
ax.set_xticklabels(idiomas, rotation=45, ha='right')
ax.legend()

# Mostrar el gráfico
plt.tight_layout()
plt.show()