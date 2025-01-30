import matplotlib.pyplot as plt
import pandas as pd

# Datos JSON
data = [
    {"idioma": "Coreano", "programas": "1582", "total_horas": "15378400000", "promedio_horas": "9720859.67"},
    {"idioma": "Inglés", "programas": "17268", "total_horas": "124441700000", "promedio_horas": "7206491.78"},
    {"idioma": "No-Inglés", "programas": "3252", "total_horas": "10439100000", "promedio_horas": "3210055.35"},
    {"idioma": "Japonés", "programas": "2297", "total_horas": "7102000000", "promedio_horas": "3091858.95"},
    {"idioma": "Ruso", "programas": "39", "total_horas": "114600000", "promedio_horas": "2938461.54"},
    {"idioma": "Hindi", "programas": "374", "total_horas": "926100000", "promedio_horas": "2476203.21"}
]

# Convertir a DataFrame
df = pd.DataFrame(data)

# Convertir las columnas a tipos numéricos
df['programas'] = pd.to_numeric(df['programas'])
df['promedio_horas'] = pd.to_numeric(df['promedio_horas'])

# Crear el gráfico combinado
fig, ax1 = plt.subplots(figsize=(12, 6))

# Gráfico de barras para el número de programas
color = 'tab:blue'
ax1.set_xlabel('Idioma')
ax1.set_ylabel('Número de programas', color=color)
ax1.bar(df['idioma'], df['programas'], color=color, alpha=0.6, label='Programas')
ax1.tick_params(axis='y', labelcolor=color)

# Crear un segundo eje y para el promedio de horas
ax2 = ax1.twinx()
color = 'tab:red'
ax2.set_ylabel('Promedio de horas', color=color)
ax2.plot(df['idioma'], df['promedio_horas'], color=color, marker='o', linestyle='-', linewidth=2, label='Promedio de horas')
ax2.tick_params(axis='y', labelcolor=color)

# Añadir título y leyenda
plt.title('Diferencias en la representación de los idiomas y su promedio de horas vistas en Netflix en 2023')
fig.tight_layout()

# Mostrar leyendas
lines, labels = ax1.get_legend_handles_labels()
lines2, labels2 = ax2.get_legend_handles_labels()
ax2.legend(lines + lines2, labels + labels2, loc='upper left')

plt.show()