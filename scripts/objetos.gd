extends Resource

# Diccionario de Armaduras
var armaduras = {
  "301": {
	"Nombre": "Placas de Hierro",
	"Descripcion": "Aumenta la resistencia y la vida máxima del jugador.",
	"Rareza": "Épico",
	"Efecto": {
	  "Defensa": 2,
	  "Vida": 10,
	  "Resistencia": "Fisica"
	}
  },
  "302": {
	"Nombre": "Túnica del Viento",
	"Descripcion": "Aumenta la velocidad de movimiento y la destreza.",
	"Rareza": "Épico",
	"Efecto": {
	  "Defensa": 2,
	  "Destreza": 1,
	  "Velocidad": 10
	}
  },
  "303": {
	"Nombre": "Manto de las Sombras",
	"Descripcion": "Proporciona invisibilidad temporal cuando el jugador tiene menos del 10% de su vida.",
	"Rareza": "Legendario",
	"Efecto": {
	  "Defensa": 3,
	  "invisibilidad": true
	}
  },
  "304": {
	"Nombre": "Piel de Dragón",
	"Descripcion": "Ofrece una resistencia significativa al fuego y el daño de quemaduras.",
	"Rareza": "Épico",
	"Efecto": {
	  "Defensa": 2,
	  "Vida": 12,
	  "Resistencia": "Fuego"
	}
  },
  "305": {
	"Nombre": "Armadura de Cristal",
	"Descripcion": "Aumenta la inteligencia del jugador y su capacidad de lanzar hechizos.",
	"Rareza": "Épico",
	"Efecto": {
	  "Defensa": 2,
	  "Inteligencia": 1,
	  "Maná": 10
	}
  },
  "306": {
	"Nombre": "Cota de Mallas Ligera",
	"Descripcion": "Aumenta la destreza.",
	"Rareza": "Raro",
	"Efecto": {
	  "Defensa": 1,
	  "Destreza": 1
	}
  },
  "307": {
	"Nombre": "Placas del Gigante",
	"Descripcion": "Mejora la fuerza del jugador y reduce el daño físico recibido.",
	"Rareza": "Épico",
	"Efecto": {
	  "Defensa": 2,
	  "Fuerza": 1,
	  "Resistencia": "Fisica"
	}
  },
  "308": {
	"Nombre": "Armadura de Escarcha",
	"Descripcion": "Proporciona resistencia al daño de hielo y aumenta el poder de los hechizos de hielo.",
	"Rareza": "Legendario",
	"Efecto": {
	  "Defensa": 3,
	  "Resistencia": "Hielo",
	  "Daño de Hielo": 7
	}
  },
  "309": {
	"Nombre": "Vestiduras de la Luz",
	"Descripcion": "Incrementa la velocidad de regeneración de vida.",
	"Rareza": "Legendario",
	"Efecto": {
	  "Defensa": 3,
	  "Poder": 1
	}
  },
  "310": {
	"Nombre": "Capa Élfica",
	"Descripcion": "Aumenta la destreza y la probabilidad de esquivar ataques.",
	"Rareza": "Épico",
	"Efecto": {
	  "Defensa": 2,
	  "Destreza": 1,
	  "Esquive": 10
	}
  }
}


# Diccionario de Amuletos
var amuletos = {
  "201": {
	"Nombre": "Amuleto de la Fuerza",
	"Descripcion": "Aumenta la fuerza del personaje.",
	"Rareza": "Raro",
	"Efecto": {
	  "Fuerza": 1
	}
  },
  "202": {
	"Nombre": "Amuleto de la Destreza",
	"Descripcion": "Aumenta la destreza del personaje.",
	"Rareza": "Raro",
	"Efecto": {
	  "Destreza": 1
	}
  },
  "203": {
	"Nombre": "Amuleto del Poder",
	"Descripcion": "Aumenta la poder del personaje.",
	"Rareza": "Raro",
	"Efecto": {
	  "Poder": 1
	}
  },
  "204": {
	"Nombre": "Amuleto de la Inteligencia",
	"Descripcion": "Aumenta la inteligencia del personaje.",
	"Rareza": "Raro",
	"Efecto": {
	  "Inteligencia": 1
	}
  },
  "205": {
	"Nombre": "Amuleto de la Certeza",
	"Descripcion": "Aumenta la probabilidad de hacer un ataque crítico.",
	"Rareza": "Epico",
	"Efecto": {
	  "Prob Critico": 5
	}
  },
  "206": {
	"Nombre": "Amuleto del Guerrero",
	"Descripcion": "Aumenta el daño infligido por armas cuerpo a cuerpo.",
	"Rareza": "Épico",
	"Efecto": {
	  "Daño de Armas Melé": 2
	}
  },
  "207": {
	"Nombre": "Amuleto del Arquero",
	"Descripcion": "Aumenta el daño infligido por armas a distancia.",
	"Rareza": "Épico",
	"Efecto": {
	  "Daño de Armas Distancia": 2
	}
  },
  "208": {
	"Nombre": "Amuleto del Mago",
	"Descripcion": "Aumenta el daño infligido de los hechizos lanzados.",
	"Rareza": "Épico",
	"Efecto": {
	  "Daño de Hechizos": 2
	}
  },
  "209": {
	"Nombre": "Amuleto de la Vida",
	"Descripcion": "Aumenta la vida máxima del jugador.",
	"Rareza": "Épico",
	"Efecto": {
	  "Vida": 8
	}
  },
  "210": {
	"Nombre": "Amuleto de la Resistencia",
	"Descripcion": "Proporciona resistencia a efectos negativos",
	"Rareza": "Legendario",
	"Efecto": {
	  "Resistencia Efectos": true
	}
  },
  "211": {
	"Nombre": "Amuleto de la Velocidad",
	"Descripcion": "Incrementa la velocidad de movimiento.",
	"Rareza": "Épico",
	"Efecto": {
	  "Velocidad": 10
	}
  },
  "212": {
	"Nombre": "Amuleto de la Suerte",
	"Descripcion": "Mejora la probabilidad de encontrar objetos raros y épicos.",
	"Rareza": "Épico",
	"Efecto": {
	  "Suerte": true
	}
  },
  "213": {
	"Nombre": "Amuleto de Maná",
	"Descripcion": "Aumenta la capacidad de lanzar hechizos.",
	"Rareza": "Épico",
	"Efecto": {
	  "Maná": 10
	}
  },
}


# Diccionario de Armas
var armas = {
  "101": {
	"Nombre": "Espada de Fuego",
	"Descripcion": "Inflige daño de fuego adicional.",
	"Tipo": "Melé",
	"Rareza": "Épico",
	"Efecto": {
	  "Daño Adicional": 3,
	  "Tipo": "Fuego"
	}
  },
  "102": {
	"Nombre": "Daga de las Sombras",
	"Descripcion": "Aumenta la velocidad del jugador y la probabilidad de golpe crítico.",
	"Tipo": "Lanzable",
	"Rareza": "Épico",
	"Efecto": {
	  "Velocidad": 10,
	  "Prob Critico": 10
	}
  },
  "103": {
	"Nombre": "Arco Élfico",
	"Descripcion": "Permite ataques a distancia y aumenta la destreza.",
	"Tipo": "Distancia",
	"Rareza": "Raro",
	"Efecto": {
	  "Destreza": 1
	}
  },
  "104": {
	"Nombre": "Hacha de Guerra",
	"Descripcion": "Ofrece un alto daño físico.",
	"Tipo": "Melé",
	"Rareza": "Raro",
	"Efecto": {
	  "Daño Adicional": 4,
	}
  },
  "105": {
	"Nombre": "Báculo Arcano",
	"Descripcion": "Aumenta el poder de los hechizos y la inteligencia.",
	"Tipo": "Magico",
	"Rareza": "Épico",
	"Efecto": {
	  "Daño de Hechizos": 3,
	  "Inteligencia": 1
	}
  },
  "106": {
	"Nombre": "Martillo de Guerra",
	"Descripcion": "Golpea con fuerza y tiene un efecto de aturdimiento.",
	"Tipo": "Melé",
	"Rareza": "Legendario",
	"Efecto": {
	  "Daño Adicional": 4,
	  "Aturdir": true
	}
  },
  "107": {
	"Nombre": "Lanza del Viento",
	"Descripcion": "Aumenta la destreza y hace daño adicional.",
	"Tipo": "Lanzable",
	"Rareza": "Épico",
	"Efecto": {
	  "Destreza": 1,
	  "Daño Adicional": 3
	}
  },
  "108": {
	"Nombre": "Ballesta Mágica",
	"Descripcion": "Permite disparos potentes a distancia.",
	"Tipo": "Distancia",
	"Rareza": "Raro",
	"Efecto": {
	  "Daño Adicional": 4
	}
	
  },
  "109": {
	"Nombre": "Espada de Hielo",
	"Descripcion": "Inflige daño de hielo adicional.",
	"Tipo": "Melé",
	"Rareza": "Épico",
	"Efecto": {
	  "Daño Adicional": 3,
	  "Tipo": "Hielo"
	}
  },
  "110": {
	"Nombre": "Escudo de Deflexión",
	"Descripcion": "Mejora la probabilidad de bloquear los ataques enemigos, aumentando la estadística de Destreza. No puedes atacar con él.",
	"Tipo": "Escudo",
	"Rareza": "Épico",
	"Efecto": {
	  "Destreza": 1,
	  "Ataque": false,
	  "Prob Bloqueo": 10
	}
  },
  "111": {
	"Nombre": "Garra de Dragón",
	"Descripcion": "Aumenta la estadística de Fuerza y permite al personaje desgarrar la armadura de los enemigos.",
	"Tipo": "Melé",
	"Rareza": "Legendario",
	"Efecto": {
	  "Fuerza": 1,
	  "Desgarrar": true
	}
  },
  "112": {
	"Nombre": "Hacha Gigante",
	"Descripcion": "Aumenta la estadística de Fuerza y tiene una probabilidad de realizar un ataque crítico que inflige un gran daño.",
	"Tipo": "Melé",
	"Rareza": "Legendario",
	"Efecto": {
	  "Fuerza": 1,
	  "Prob Critico": 5,
	  "Daño Crítico": 10
	}
  }
}


# Agregar funciones para acceder a los diccionarios
func obtener_diccionario_armaduras():
	return armaduras

func obtener_diccionario_amuletos():
	return amuletos

func obtener_diccionario_armas():
	return armas
