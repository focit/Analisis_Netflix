import matplotlib.pyplot as plt
import json

# JSON proporcionado
data_json = '''
[
  {
    "mes": "1",
    "mes_nombre": "Enero",
    "numero_lanzamientos": "608",
    "total_horas": "7271600000"
  },
  {
    "mes": "2",
    "mes_nombre": "Febrero",
    "numero_lanzamientos": "560",
    "total_horas": "7103700000"
  },
  {
    "mes": "3",
    "mes_nombre": "Marzo",
    "numero_lanzamientos": "690",
    "total_horas": "7437100000"
  },
  {
    "mes": "4",
    "mes_nombre": "Abril",
    "numero_lanzamientos": "647",
    "total_horas": "6865700000"
  },
  {
    "mes": "5",
    "mes_nombre": "Mayo",
    "numero_lanzamientos": "624",
    "total_horas": "7094600000"
  },
  {
    "mes": "6",
    "mes_nombre": "Junio",
    "numero_lanzamientos": "670",
    "total_horas": "8522000000"
  },
  {
    "mes": "7",
    "mes_nombre": "Julio",
    "numero_lanzamientos": "631",
    "total_horas": "6524800000"
  },
  {
    "mes": "8",
    "mes_nombre": "Agosto",
    "numero_lanzamientos": "674",
    "total_horas": "6817800000"
  },
  {
    "mes": "9",
    "mes_nombre": "Septiembre",
    "numero_lanzamientos": "739",
    "total_horas": "7262200000"
  },
  {
    "mes": "10",
    "mes_nombre": "Octubre",
    "numero_lanzamientos": "802",
    "total_horas": "8123200000"
  },
  {
    "mes": "11",
    "mes_nombre": "Noviembre",
    "numero_lanzamientos": "734",
    "total_horas": "7749500000"
  },
  {
    "mes": "12",
    "mes_nombre": "Diciembre",
    "numero_lanzamientos": "787",
    "total_horas": "10055800000"
  }
]
'''

# Convertir JSON a lista de diccionarios
data = json.loads(data_json)

# Extraer los datos relevantes
meses = [item['mes_nombre'] for item in data]
numero_lanzamientos = [int(item['numero_lanzamientos']) for item in data]
total_horas = [int(item['total_horas']) / 1e9 for item in data]  # Convertir a miles de millones

# Crear la figura y el eje principal
fig, ax1 = plt.subplots(figsize=(12, 6))

# Gráfico de barras para el número de lanzamientos (eje Y izquierdo)
color_barras = 'skyblue'
ax1.bar(meses, numero_lanzamientos, color=color_barras, alpha=0.6, label='Número de lanzamientos')
ax1.set_xlabel('Mes')
ax1.set_ylabel('Número de lanzamientos', color=color_barras)
ax1.tick_params(axis='y', labelcolor=color_barras)

# Crear un segundo eje Y para el total de horas (eje Y derecho)
ax2 = ax1.twinx()
color_linea = 'tab:red'
ax2.plot(meses, total_horas, marker='o', linestyle='-', color=color_linea, label='Total de horas (en miles de millones)')
ax2.set_ylabel('Total de horas (en miles de millones)', color=color_linea)
ax2.tick_params(axis='y', labelcolor=color_linea)

# Añadir etiquetas con los valores del total de horas
for i, valor in enumerate(total_horas):
    ax2.text(i, valor + 0.1, f'{valor:.1f}B', ha='center', va='bottom', fontsize=9, color=color_linea)

# Añadir título
plt.title('Tendencia en el número de lanzamientos y total de horas en Netflix por mes del año 2023')

# Rotar las etiquetas del eje X para mejor legibilidad
plt.xticks(rotation=45, ha='right')

# Combinar las leyendas de ambos ejes
lines1, labels1 = ax1.get_legend_handles_labels()
lines2, labels2 = ax2.get_legend_handles_labels()
ax1.legend(lines1 + lines2, labels1 + labels2, loc='upper left')

# Mostrar el gráfico
plt.tight_layout()
plt.show()