/*
8. Pregunta: ¿Hay una similitud en la tendencia entre el número de lanzamientos y las horas vistas por mes en 2023?
- Obtener el mes de la fecha de lanzamiento.
- Utilizar CASE para nombrar los meses.
- Contar el número de películas lanzadas y agruparlas por mes.
- Sumar las horas vistas y agruparlas por mes.
¿Por qué? Saber si existe una correlación entre el número de lanzamiento y la popularidad de los mismos en Netflix en 2023.
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
COUNT(*) AS numero_lanzamientos,
SUM(horas_vistas) AS total_horas
FROM netflix_content_2023
WHERE EXTRACT(MONTH FROM fecha_de_lanzamiento) IS NOT NULL
GROUP BY 1,2
ORDER BY 1;

/*
Insights:
El número de lanzamientos ha sido constante durante todo el año con un pequeño incremento en los últimos cuatro meses. Sin embargo,
como vimos anteriormente, en el número de horas vitas hay un mayor incremento en los meses con fechas especiales (Junio, Octubre y
Diciembre).

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
*/
