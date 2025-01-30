/*
6. Pregunta: ¿En qué mes del año se estrenaron los programas más populares en 2023?
- Extraer el mes de la fecha de lanzamiento.
- Utilizar el CASE para obtener el nombre de cada mes.
- Sumar las horas vistas y agruparlas por mes.
- Eliminar los datos nulos que no contengan fecha de lanzamiento.
¿Por qué? Conocer en qué mes del año se lanzaron los programas con mayor cantidad de horas vistas en Netflix en el año 2023.
*/

SELECT
EXTRACT(MONTH FROM fecha_de_lanzamiento) AS mes,
CASE WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 1 THEN 'Enero' 
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 2 THEN 'Febrero'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 3 THEN 'Marzo'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 4 THEN 'Abril'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 5 THEN 'Mayo'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 6 THEN 'Junio'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 7 THEN 'Julio'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 8 THEN 'Agosto'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 9 THEN 'Septiembre'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 10 THEN 'Octubre'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 11 THEN 'Noviembre'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) = 12 THEN 'Diciembre'
END AS mes_nombre,
SUM(horas_vistas) AS horas_de_visualización
FROM netflix_content_2023
WHERE EXTRACT(MONTH FROM fecha_de_lanzamiento) IS NOT NULL
GROUP BY 1
ORDER BY 1;

/*
Insights:
En el mes de Junio, Octubre y Diciembre de lanzaron los títulos más consumidos en 2023. Mientras que en Abril, Julio y Agosto 
los de menor popularidad. La relación entre los meses y la popularidad se debe a fechas especiales en cada mes Junio (vacaciones 
de verano), Octubre (Halloween) y Diciembre (Navidad).

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
*/