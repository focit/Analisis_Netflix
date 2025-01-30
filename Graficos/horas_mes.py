import matplotlib.pyplot as plt
import json

# JSON proporcionado
data_json = '''
[
  {
    "mes": "1",
    "mes_nombre": "Enero",
    "horas_de_visualización": "7271600000"
  },
  {
    "mes": "2",
    "mes_nombre": "Febrero",
    "horas_de_visualización": "7103700000"
  },
  {
    "mes": "3",
    "mes_nombre": "Marzo",
    "horas_de_visualización": "7437100000"
  },
  {
    "mes": "4",
    "mes_nombre": "Abril",
    "horas_de_visualización": "6865700000"
  },
  {
    "mes": "5",
    "mes_nombre": "Mayo",
    "horas_de_visualización": "7094600000"
  },
  {
    "mes": "6",
    "mes_nombre": "Junio",
    "horas_de_visualización": "8522000000"
  },
  {
    "mes": "7",
    "mes_nombre": "Julio",
    "horas_de_visualización": "6524800000"
  },
  {
    "mes": "8",
    "mes_nombre": "Agosto",
    "horas_de_visualización": "6817800000"
  },
  {
    "mes": "9",
    "mes_nombre": "Septiembre",
    "horas_de_visualización": "7262200000"
  },
  {
    "mes": "10",
    "mes_nombre": "Octubre",
    "horas_de_visualización": "8123200000"
  },
  {
    "mes": "11",
    "mes_nombre": "Noviembre",
    "horas_de_visualización": "7749500000"
  },
  {
    "mes": "12",
    "mes_nombre": "Diciembre",
    "horas_de_visualización": "10055800000"
  }
]
'''

# Convertir JSON a lista de diccionarios
data = json.loads(data_json)

# Extraer los datos relevantes
meses = [item['mes_nombre'] for item in data]
horas_visualizacion = [int(item['horas_de_visualización']) / 1e9 for item in data]  # Convertir a miles de millones

# Crear el gráfico lineal
plt.figure(figsize=(10, 6))
plt.plot(meses, horas_visualizacion, marker='o', linestyle='-', color='b', label='Horas de visualización')

# Añadir etiquetas con los valores de las horas de visualización
for i, valor in enumerate(horas_visualizacion):
    plt.text(i, valor + 0.1, f'{valor:.1f}B', ha='center', va='bottom', fontsize=9)

# Añadir título y etiquetas de ejes
plt.title('Horas de visualización por mes de lanzamiento en Netlix en 2023')
plt.ylabel('Horas de visualización (en miles de millones)')

# Rotar las etiquetas del eje X para mejor legibilidad
plt.xticks(rotation=45, ha='right')

# Mostrar el gráfico
plt.tight_layout()
plt.legend()
plt.show()