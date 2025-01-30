import matplotlib.pyplot as plt
import pandas as pd

# Datos JSON
data = [
    {"dia": "0", "dia_de_la_semana": "Domingo", "numero_lanzamientos": "179", "numero_horas": "1935300000"},
    {"dia": "1", "dia_de_la_semana": "Lunes", "numero_lanzamientos": "436", "numero_horas": "3954500000"},
    {"dia": "2", "dia_de_la_semana": "Martes", "numero_lanzamientos": "995", "numero_horas": "5562300000"},
    {"dia": "3", "dia_de_la_semana": "Miércoles", "numero_lanzamientos": "1310", "numero_horas": "15744100000"},
    {"dia": "4", "dia_de_la_semana": "Jueves", "numero_lanzamientos": "1145", "numero_horas": "20292800000"},
    {"dia": "5", "dia_de_la_semana": "Viernes", "numero_lanzamientos": "3863", "numero_horas": "38217200000"},
    {"dia": "6", "dia_de_la_semana": "Sábado", "numero_lanzamientos": "238", "numero_horas": "5121800000"}
]

# Convertir a DataFrame
df = pd.DataFrame(data)

# Convertir las columnas a tipos numéricos
df['numero_lanzamientos'] = pd.to_numeric(df['numero_lanzamientos'])
df['numero_horas'] = pd.to_numeric(df['numero_horas'])

# Crear el gráfico combinado
fig, ax1 = plt.subplots(figsize=(10, 6))

# Gráfico de barras para el número de lanzamientos
color = 'tab:blue'
ax1.set_xlabel('Día de la semana')
ax1.set_ylabel('Número de lanzamientos', color=color)
ax1.bar(df['dia_de_la_semana'], df['numero_lanzamientos'], color=color, alpha=0.6, label='Lanzamientos')
ax1.tick_params(axis='y', labelcolor=color)

# Crear un segundo eje y para el número de horas
ax2 = ax1.twinx()
color = 'tab:red'
ax2.set_ylabel('Número de horas', color=color)
ax2.plot(df['dia_de_la_semana'], df['numero_horas'], color=color, marker='s', label='Horas')
ax2.tick_params(axis='y', labelcolor=color)

# Añadir título y leyenda
plt.title('Tendencia en el número de lanzamientos y horas vistas en Netflix por día de la semana en 2023')
fig.tight_layout()

# Mostrar leyendas
lines, labels = ax1.get_legend_handles_labels()
lines2, labels2 = ax2.get_legend_handles_labels()
ax2.legend(lines + lines2, labels + labels2, loc='upper left')

plt.show()