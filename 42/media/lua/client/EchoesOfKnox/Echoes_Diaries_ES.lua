-- Echoes_Diaries_ES.lua: version española (chilena) de los headers y textos
-- de los 70 diarios. Carga alfabeticamente despues de Echoes_Diaries.lua y
-- popula Echoes.Diaries.HEADERS_ES y Echoes.Diaries.TEXTS_ES. Se elige
-- runtime segun Echoes.getLang(). Español en variante chilena: tú + conju-
-- gaciones estandar, sin rioplatense (vos/querés/sabés).

Echoes = Echoes or {}
Echoes.Diaries = Echoes.Diaries or {}
Echoes.Diaries.HEADERS_ES = Echoes.Diaries.HEADERS_ES or {}
Echoes.Diaries.TEXTS_ES   = Echoes.Diaries.TEXTS_ES   or {}

local H = Echoes.Diaries.HEADERS_ES
local T = Echoes.Diaries.TEXTS_ES

-- ============================================================================
-- HEADERS
-- ============================================================================

H[1] = {
    name = "Dr. Elliot Hargreaves",
    role = "Médico Internista",
    source = "Libreta de cuero marrón encontrada en un cajón del consultorio de urgencias del Hospital de Riverside. Páginas sueltas, algunas en hojas de recetario. Letra de doctor.",
}

H[2] = {
    name = "Claire Vance",
    role = "Enfermera Titulada",
    source = "Cuaderno escolar tapa azul, rayado, con una calcomanía de una margarita medio despegada. Departamento arriba de la panadería de Muldraugh. Bolígrafos de distintos colores.",
}

H[3] = {
    name = "Marcus \"Buck\" Delaney",
    role = "Cajero y Reponedor de Supermercado",
    source = "Libreta de espiral del Zippee Dee Mart, a lápiz. Manchas de café. Letra imprenta grande, muchas exclamaciones.",
}

H[4] = {
    name = "Padre Tobías Cross",
    role = "Sacerdote Católico",
    source = "Diario espiritual de tapa dura negra, parroquia Saint Anne, Rosewood. La primera página dice A.M.D.G. Las entradas suenan más a confesión que a oración.",
}

H[5] = {
    name = "Rhett \"Hawk\" Malone",
    role = "Mecánico Automotriz (ex-piloto)",
    source = "Anotaciones en los márgenes de un manual de vuelo Beechcraft King Air de 1978, a lápiz de taller. Frases cortas. Muchas tachaduras.",
}

H[6] = {
    name = "Daniel \"Danny\" Orozco",
    role = "Profesor de Educación Física",
    source = "Planillas de asistencia del gimnasio Iron Will, dobladas en cuatro, escritas por el dorso. Manchas de sudor. Letra de madrugada.",
}

H[7] = {
    name = "Dr. Isaac Volkov",
    role = "Biólogo, ex-investigador agroindustrial, agricultor independiente",
    source = "Cuadernos numerados de tapa dura, del I al XXIII, sótano de la casa de Rosewood. Letra de científico, precisa al principio, temblorosa hacia el final. Dos idiomas, inglés y ruso, a veces en la misma línea.",
}

-- ============================================================================
-- SUJETO 01 — Dr. Elliot Hargreaves (Médico)
-- ============================================================================
T[1] = {}

T[1][1] = [[
Martes, 3 de noviembre.

Perdí hoy a un paciente de sesenta y ocho años, infarto masivo, no había nada que hacer. Margaret me preguntó cómo había estado el día y le dije que bien. Le dije bien. Después me fui al estudio y me serví un whisky y estuve una hora mirando la pared. Hace cuánto que le miento a mi mujer por cosas que no son siquiera mentiras, sino cansancios que no sé cómo contarle. Los niños dormían. Tomás tenía la boca abierta como cuando era chico. Sophie abrazaba al oso. A veces pienso que esta es la vida que elegí, y que está bien. A veces no.
]]

T[1][2] = [[
Viernes, 13 de noviembre.

Entró una enfermera nueva esta semana. Claire. Le enseñé a entubar a un niño con crup y se le quedaron las manos temblando una hora después, no por el miedo, por la adrenalina. Se rió sola en el pasillo. Me miró. Yo la miré. No pasó nada. Pero algo pasó. No voy a escribir esto en ningún lado serio. Anoto aquí porque necesito dejarlo en alguna parte.
]]

T[1][3] = [[
Miércoles, 27 de enero.

Le compré un teléfono. Prepago, pequeño, uno de esos que caben en una cartera chica. Lo activé a nombre de una paciente que murió hace meses y que nunca dio de baja la línea. Pagué en efectivo en West Point para que no quedara en mis tarjetas. Dios, escucharme. Hablo como un estafador. Me paso la vida operando gente y resulta que la mentira más compleja que aprendí a hacer fue comprarle un celular a una mujer que no es mi esposa.
]]

T[1][4] = [[
Sábado, 11 de abril.

Louisville. Cuatrocientos dólares en una mesa de blackjack y los gastamos todos en una noche como si fuéramos jóvenes. Claire se compró unos zapatos que nunca va a poder usar en el hospital. Yo comí una cosa francesa cuyo nombre no pude pronunciar. Volvimos por la 65 a las cinco de la mañana con la radio fuerte, las ventanas abiertas, el aire frío, y yo manejaba con una mano y la otra sobre su rodilla, y ella dormía con la boca entreabierta contra el vidrio. Pensé que ojalá esa carretera no terminara nunca. Después me acordé de Margaret y Tomás y Sophie y me dio un vacío en el estómago. Pero la carretera siguió. Y yo seguí.
]]

T[1][5] = [[
Jueves, 2 de julio.

Hoy atendí a una niña en urgencias, caída en bicicleta, nueve años, brazo fracturado. El padre estaba desesperado, tipo joven, musculoso, profesor de gimnasia o algo así. Le sostenía la mano a la niña en la sala de espera como si fuera a caérsele. Me quedé pensando en esa imagen. En el padre y en la hija. En lo que significa ser el que espera afuera. Yo siempre estoy del otro lado de la puerta. No sé si alguna vez podría ser el que espera.
]]

T[1][6] = [[
Sábado, 15 de agosto.

Escribí una carta. No pienso mandarla. Le digo a Claire que el verano que viene voy a dejar a Margaret. Que le voy a dar tiempo a los niños, que voy a buscar un departamento en Louisville, que vamos a empezar de nuevo. La guardé doblada dentro del libro de anatomía de Netter, tomo 2, página de la región pélvica, por un chiste privado que ella entendería. No le voy a mandar la carta porque no estoy seguro. Pero tampoco la rompí. Eso también es una respuesta, supongo.
]]

T[1][7] = [[
Viernes, 11 de septiembre.

Hoy una colega me dijo, medio en broma, medio no, que llevo un año más contento de lo normal. Que se me nota. No supe qué contestar. Después en el estacionamiento escuché a dos enfermeras hablando y una le decía a la otra "a la Vance también la veo distinta". Se me heló algo adentro. Después se me calentó. Después me di cuenta de que había sonreído solo, en el auto, como un idiota.
]]

T[1][8] = [[
Sábado, 3 de octubre — Claire no apareció.

Llamé al teléfono escondido trece veces. No contesta. Fui a Muldraugh. El departamento está cerrado. La panadera de abajo me dijo que no la ve desde el viernes. Tuve que sentarme en la escalera para no vomitar. Volví al hospital y pregunté disimuladamente. Nadie sabe nada. No puedo hacer más. No puedo poner su cara en un cartel de desaparecida. No puedo decirle a la policía que la busco porque soy su amante. Margaret me preguntó en la cena si me sentía bien. Le dije que había perdido un paciente. Otra vez.
]]

T[1][9] = [[
Jueves, 8 de octubre — el Iron Will.

Fui al gimnasio donde ella entrena. Nada. El recepcionista me miró raro. Había un viejo en la cafetería del frente que me quedó mirando, barba blanca, libro en la mano. No lo reconocí. Después pensé que quizás sí, que me sonaba de alguna conferencia vieja, pero me lo saqué de la cabeza. Hoy no tengo cabeza para caras. Hoy solo tengo cabeza para una cara.
]]

T[1][10] = [[
Viernes, 16 de octubre — llegó un paquete.

Margaret lo dejó en la entrada. Sin remitente. Lo abrí en el baño con la puerta cerrada. Una manzana roja. Una placa de metal con un número: 02. Y una nota de ella, mi Claire, su letra, diciéndome que está viva, que la espero mañana a las seis en la cabaña del lago. La cabaña del lago. Solo ella y yo sabemos lo de la cabaña del lago.

Me colgué la placa bajo la camisa ahora mismo. Margaret está durmiendo. Mañana le voy a decir que tengo un congreso en Lexington, le voy a dar un beso, voy a manejar hasta ahí y la voy a abrazar. Está viva. Dios, está viva.

Si esta es la última vez que escribo en esta libreta porque la próxima vez ya estoy con ella y empieza todo de nuevo, está bien. Está muy bien.
]]

-- ============================================================================
-- SUJETO 02 — Claire Vance (Enfermera)
-- ============================================================================
T[2] = {}

T[2][1] = [[
Domingo, 8 de marzo.

Hoy fui a ver a mamá al hogar. Estaba mejor. Me reconoció. Me preguntó por papá, como si papá no hubiera muerto hace quince años. Le dije que estaba trabajando. A veces es más fácil mentirle que explicárselo otra vez. La enfermera del hogar me dijo que hoy mamá había cantado una canción en el almuerzo, una que yo no conocía. Me fui manejando escuchando la radio sin radio. Doc me recibió maullando como si hubiera pasado un mes. Le di atún. Me serví una copa de vino. Hoy es domingo y estoy cansada y es una tristeza vieja la que tengo, no una nueva.
]]

T[2][2] = [[
Martes, 17 de marzo.

Hoy en el turno un médico me enseñó a entubar a un niño con crup. Se llama Hargreaves. Tiene canas y ojos marrones y se le queda la mano sobre el hombro del paciente una fracción de segundo más de lo necesario. Cuando me explicó el procedimiento me miró como si yo fuera la única persona en la sala. Después no pasó nada. Pero en el ascensor de vuelta al piso me di cuenta de que me había arreglado el pelo y ni siquiera sabía cuándo.
]]

T[2][3] = [[
Sábado, 2 de mayo.

Pasamos la noche en un motel de West Point. Nombres falsos. Él puso "John Smith" y yo me reí tanto que casi no pude entrar al lobby. Después fue menos gracioso. Después fue hermoso. Después fue culpa. Vuelvo a casa en el auto y pienso en su esposa, Margaret, que no conozco pero tiene nombre. Pienso en sus hijos. Pienso en mí. No puedo seguir. Mañana le digo. Mañana le digo. Escribo "mañana le digo" y sé que no le voy a decir nada. Doc me mira como si supiera. Gato traidor.
]]

T[2][4] = [[
Jueves, 18 de junio — taller de cerámica.

Terminé una taza hoy. Fea pero terminada. La profesora me dijo que tengo manos de enfermera, que no les tengo miedo al barro. Me reí. Me gustó. Voy a regalársela a él, qué tontería, una taza para un hombre casado, pero voy a hacerlo igual. La próxima semana hago otra para mamá.
]]

T[2][5] = [[
Domingo, 30 de agosto — el almacén de West Point.

Hoy pasé por el Zippee Dee Mart a comprar leche y el cajero, un señor flaco con barba canosa y gorra de los Cardinals, me puso una manzana en la bolsa sin cobrármela. Me dijo "para la enfermera linda". Me dio ternura. Me comí la manzana caminando, después del turno, antes de ir al departamento donde él me esperaba. Lo que no sabe el cajero es que las manzanas son importantes en mi vida de una manera rara que no le puedo explicar a nadie. Gracias, señor Cardinals.
]]

T[2][6] = [[
Miércoles, 9 de septiembre — Danny.

Hoy en el gimnasio me quedé en la banca después del entrenamiento. Danny, el profe, se sentó al lado. Le terminé contando cosas que no le cuento a nadie. No todo. Pero bastante. Es buen tipo. Me dio una cápsula rara y me dijo que me ayudaría a sentirme mejor conmigo misma. Lo vi con tanta buena fe que no tuve corazón para no aceptarla. La tengo en el bolsillo del jean. No sé si la voy a tomar. Puede que sí.
]]

T[2][7] = [[
Miércoles, 9 de septiembre — nota de la noche.

Me la tomé. Esperé. Me miré en el espejo buscando algo. No sentí nada. Vino él. Todo fue igual. Todo fue exactamente igual que siempre. Y fue ahí, mientras él dormía y yo miraba el techo, que entendí algo. No quiero seguir siendo la otra. No quiero más códigos, ni manzanas en escritorios, ni nombres falsos. La pastilla no me hizo nada en el cuerpo. Pero me hizo algo en la cabeza. Le voy a pedir que la deje. Esta vez va en serio.
]]

T[2][8] = [[
Viernes, 2 de octubre — llegó un paquete.

Una caja en la puerta esta mañana. Sin remitente. Manzana roja. Placa de metal con el número 01 grabado. Y una nota: "Para que no tengas que esconderlo más. Te espero esta noche en el motel del kilómetro 12. Voy a dejarla." Es él. Tiene que ser él. Nadie más en el mundo diría esa frase. Lloré diez minutos en el piso de la cocina y no fue de tristeza, fue de alivio. Después de tres años. Me colgué la placa bajo la blusa y me la dejé contra la piel. Voy a ir esta noche. Si esta es la última página antes del resto de mi vida, bueno. Que empiece el resto. Doc, pórtate bien. Vuelvo mañana.
]]

T[2][9] = [[
[Sin fecha — escrito a lápiz en una servilleta encontrada en su bolsillo]

me duele todo. hay un viejo. no es él. me duele la cabeza. si alguien encuentra esto por favor avísenle a elliot. él sabe dónde vivo. él sabe quién soy. doc está solo. por favor el gato.
]]

T[2][10] = [[
[Papel doblado en cuatro — escrito meses después, letra temblorosa]

Ya no escribo mucho. Me tiemblan las manos y las venas se me ven negras hasta los dedos. Pero hoy le escribí una carta larga a alguien que no conozco y sentí, por primera vez desde el motel, que estaba haciendo algo bien. Éramos siete alrededor de un auto y firmamos todos. Le dejé la caja en la puerta y no miré atrás.

Elliot me apretó la mano cuando volví. No dijo nada. No hacía falta.

Espero que ese alguien lea esto algún día y entienda que nosotros también fuimos gente, antes. Fuimos gente que quiso a otras personas. Fuimos gente que comió manzanas en las cocinas. Fuimos gente. Nada más.
]]

-- ============================================================================
-- SUJETO 03 — Marcus "Buck" Delaney (Cajero)
-- ============================================================================
T[3] = {}

T[3][1] = [[
Lunes, 4 de mayo.

Hoy Fign se subió al hombro mientras yo leía el diario y se quedó ahí toda la media hora del café. Rufus gruñó celoso. Les dije a los dos que hay Buck para todos. Rufus no lo entendió pero se echó a mis pies igual. Fign me robó un pedacito de la galleta. Son mis hijos, estos dos. No los cambio por nada.
]]

T[3][2] = [[
Jueves, 21 de mayo — la luz.

ANOCHE VI UNA LUZ. Sobre los árboles al sur. No era avión, no era satélite, no era luna. Estuvo quieta como quince minutos y después se fue sin moverse, como si se hubiera apagado. La tercera en mi vida. Le conté hoy a la señora Henderson, me dijo "Buck, otra vez", se rió, compró pan. Yo ya me acostumbré. Pero esta vez era distinto. Esta vez sentí que era por mí. Que estaban viendo si yo estaba listo. Fign se despertó y se metió debajo de la cama y no salió hasta la mañana. Los animales saben.
]]

T[3][3] = [[
Sábado, 6 de junio — la enfermera linda.

Entró al almacén una chica que viene seguido, castaña, ojos cansados, se ve que trabaja en el hospital. Hoy traía cara de tres turnos seguidos. Le puse una manzana en la bolsa sin cobrársela. Le dije "para la enfermera linda". Se sonrió. Me acordé de mi tía Edith cuando yo era chico. Hay gente que necesita una manzana más que otra. Uno las va dando como puede.
]]

T[3][4] = [[
Martes, 16 de junio — el padre Cross.

Pasó el padre Tobías a comprar café. Le conté lo de la luz. Se quedó callado más de lo que se queda callada la gente educada. Después me dijo "cuídate, Buck", y se fue mirando a la calle vacía. A ese cura le pasan cosas. No como a mí. Cosas distintas. Cosas más tristes. Un día me voy a animar a preguntarle.
]]

T[3][5] = [[
Domingo, 28 de junio — Fign y la ardilla del vecino.

Fign se peleó con una ardilla del patio del señor McKenzie. Ganó Fign. Volvió con una oreja rota y la dignidad intacta. Le curé con un algodón. Me mordió la oreja suavecito cuando terminé. Es su manera de dar las gracias. Rufus se hizo el dormido todo el episodio. Ese perro es un cobarde divino.
]]

T[3][6] = [[
Miércoles, 8 de julio — los sueños.

Tres noches seguidas soñando lo mismo. Estoy parado en el medio de un claro en el bosque. Arriba no hay luna, hay algo más. No puedo moverme pero no tengo miedo. Una voz me dice "ya falta poco, Marcus". Me despierto y estoy tranquilo. Nadie me llama Marcus desde que se murió mamá.
]]

T[3][7] = [[
Viernes, 31 de julio — ojos.

HOY SENTÍ OJOS EN LA NUCA TODO EL DÍA. En el almacén, en la camioneta, en la casa. No es paranoia. Es atención. Alguien mira. Lo siento en los omóplatos como un frío. Rufus gruñó a un rincón del living donde no había nada. Fign se quedó quieta, más quieta que nunca, sobre la cortina. Los tres sabíamos. No sé quién nos mira. Pero que sepa que estoy listo.
]]

T[3][8] = [[
Martes, 15 de septiembre — llegó el paquete.

LLEGÓ. LLEGÓ. Una caja en el mostrador esta tarde. Sin remitente. Adentro una manzana roja y una placa de metal con mi nombre y el número 03. Y una nota que dice "Marcus, llegó el momento. Sabíamos que estabas listo". CINCUENTA Y DOS AÑOS. Cincuenta y dos años diciéndolo y nadie creyéndome. Hoy lloré detrás de la caja registradora con Rufus a los pies. Pero no de tristeza. De orgullo. Esta noche voy al claro. Les dejo comida a Rufus y a Fign para tres días. Si vuelvo, les cuento. Si no vuelvo, que sepan que fui feliz.
]]

T[3][9] = [[
[Nota pegada al refrigerador, letra cuidadosa]

RUFUS come a las 7 y a las 6. No más. Está gordito. Las pastillas del corazón en el bote amarillo, una cada mañana. FIGN come nueces peladas (NO con cáscara, se atraganta), frutillas de vez en cuando. La llave del buzón está en la lata de café. Si esta vez no vuelvo, los quiero a los dos. No me esperen. Hubo alguien que vino a buscarme y yo sabía que iba a venir. Vecino Henderson, por favor pasa a darles de comer. Gracias. Marcus.
]]

T[3][10] = [[
[Hoja suelta, meses después, letra torcida]

escribo mal. me cuesta. estoy con los otros seis. son buena gente. el cura me cuida. el doctor también. el mecánico habla poco y yo hablo por dos así que estamos bien. no fueron los marcianos, escribo esto para el Buck de antes que se lo merece saber. no fueron los marcianos. fue un viejo con un huerto que se equivocó. pero igual me eligieron. igual me vieron. yo tenía razón toda la vida y eso me lo llevo. rufus si estás vivo perdón. fign si estás viva perdón. me sacaron sangre pero me dejaron el corazón. buck de antes, duerme tranquilo, tuviste razón.
]]

-- ============================================================================
-- SUJETO 04 — Padre Tobías Cross (Sacerdote)
-- ============================================================================
T[4] = {}

T[4][1] = [[
Domingo, 12 de marzo — aniversario de Ellie.

Dieciocho años hoy. Celebré la misa de las nueve como siempre. Nadie en el pueblo sabe qué día es hoy para mí. Después, en la sacristía, me arrodillé y le pedí perdón a ella, no a Dios. Dios me perdona por oficio. Ellie no está. Y eso es lo que no se cura. Esta noche paso por la esquina de la casa donde murió. Ya no me detengo. Hace años que no me detengo. Pero pasar, paso.
]]

T[4][2] = [[
Jueves, 2 de abril — la prisión.

Los miércoles sigo yendo a la prisión. Hoy confesé a un muchacho de Rosewood que mató a su mujer a golpes. Tiene veintiséis años. Llora como un niño. Le di la absolución y sentí, al hacerlo, que me la estaba dando a mí mismo. Dios, perdóname. No por los pecados que cometí. Por los pecados que sigo cometiendo cada vez que me dejo querer por esta gente que no sabe quién fui.
]]

T[4][3] = [[
Viernes, 24 de abril — Hawk.

Llevé el Plymouth al taller. Hawk me recibió con su café negro. Hablamos tres horas. Él no cree en Dios. Yo no le creo mucho a lo de no creer. Nos reímos. Me dijo que si Dios existe es ingeniero, no poeta. Le dije que yo lo creo mecánico. Se quedó pensando dos días, después me mandó un mensaje: "capaz que tiene razón, padre". Con Hawk no hablo de Ellie. No hablo de nada que importe de verdad. Pero hablo, y es lo más parecido a un amigo que he tenido desde entonces.
]]

T[4][4] = [[
Domingo, 10 de mayo — Isaac.

Hoy vino Isaac a dejarme hierbas para los enfermos. Hace años hace esto. No sé mucho de él, salvo que es viudo y habla poco. Pero lo vi cansado hoy. Más que cansado. Aparentó normalidad pero tenía los ojos de alguien que está cargando una cosa muy grande. Le pregunté si quería confesarse. Se rió sin ganas y me dijo "padre, si me confieso le arruino la semana". Lo abracé. Nunca nadie se ha puesto tan rígido en un abrazo mío. Rezo por él esta noche.
]]

T[4][5] = [[
Miércoles, 17 de junio — Buck y la luz.

Buck me contó que vio otra luz en el cielo. Sobre los árboles al sur. Me quedé callado. En esta parroquia, en las noches de vigilia, yo también he sentido cosas que no cuadran con nada que me enseñaron en el seminario. No hablo de eso con nadie. Pero cuando Buck me contó lo suyo, me dieron ganas de decírselo. Me contuve. Le dije "cuídate, Buck". Ojalá algún día me anime.
]]

T[4][6] = [[
Martes, 7 de julio — el sueño.

Soñé con Ellie. Pero no con la Ellie de los últimos años. Con la Ellie de los nueve, la que me seguía al patio con las trenzas chuecas. Me decía "Toby, levántate que vamos a llegar tarde". Me desperté llorando. Hace una década que no sueño con ella así. Me pregunté qué significa. Me pregunté si Dios está avisándome algo. Después me pregunté si Dios avisa, o si solamente espera.
]]

T[4][7] = [[
Sábado, 1 de agosto — un preso.

Hoy en la prisión me pasó algo raro. Un guardia me miró más tiempo del necesario. Me pareció, por un segundo, que sabía. No puede saber. Nadie sabe salvo los tres que están en la cárcel por lo que pasó, y Hank nunca habló. Nunca va a hablar. Pero esa mirada me quedó en el cuerpo todo el día. Dios, si quieres que mi secreto salga, que salga. Pero dame el valor de no huir cuando lo haga.
]]

T[4][8] = [[
Jueves, 22 de octubre — llegó una carta.

Dejaron una caja en la sacristía. Sin remitente. Manzana roja, placa con el número 04, y una carta larga escrita a máquina. Es de Hank. Dieciocho años sin saber de él. Dice que quiere confesarse conmigo antes de morir. Dice que un guardia le va a dejar abierta la puerta lateral del pabellón B el sábado a las cuatro de la mañana. Que vaya solo. Lo estuve rezando tres horas arrodillado. Tengo miedo. Pero también tengo algo más grande que el miedo. Esto es lo que he esperado dieciocho años. Este es el tribunal de Dios que me corresponde. Voy a ir.
]]

T[4][9] = [[
[Hoja arrancada de una Biblia, escrita al margen de Mateo 6]

no era Hank. no era nadie. la puerta se cerró detrás. me quedé sin óleos, sin estola, solo con la cajita. un viejo me dijo que iba a hacer de mí algo importante. me sacó sangre. me habló de ciencia. yo rezaba fuerte en mi cabeza para que le diera vergüenza a él, no a mí. Ellie, si estás mirando desde donde estés, no es venganza lo que quiero. Ya no. Solo quiero que termine.
]]

T[4][10] = [[
[Nota encontrada junto a los otros diarios, escrita con mano que apenas obedece]

Dios me permitió dos cosas hermosas al final. La primera fue perdonar al viejo que nos usó. No por él. Por mí. La segunda fue escribir, con los otros seis, una carta para alguien que no conozco. No le pusimos nuestros pecados. Le pusimos nuestros nombres. Espero que sea suficiente. Señor, que cuando mi cuerpo deje de ser mi cuerpo, mi alma ya esté contigo y no adentro de lo que viene. Amén.
]]

-- ============================================================================
-- SUJETO 05 — Rhett "Hawk" Malone (Mecánico)
-- ============================================================================
T[5] = {}

T[5][1] = [[
Enero — sin día.

Empecé el proyecto del sedán. Ford del 71. Le adapté un sistema que leí en una revista vieja de aviónica. Si funciona, va a conducirse solo. Si no funciona, tiro todo por el barranco y me río. No me lo voy a decir en voz alta, pero este proyecto me está salvando el invierno.
]]

T[5][2] = [[
Marzo — sin día.

Vino Tobías con el Plymouth. Ese auto es un cadáver y él lo sabe y yo lo sé, pero los dos hacemos como si lo estuviéramos salvando. Dos tazas de café malo. Me preguntó si creía en algo. Le dije que sí, en los motores. Se rió. No le dije lo otro. Lo otro es para mí.
]]

T[5][3] = [[
Abril — martes.

Vista peor. Hoy confundí una 10mm con una 11mm y eso ya es un problema. A los clientes les dije que tenía arena en los lentes. Adentro me vine abajo. Mañana no voy a abrir el taller. Mañana voy a tomarme una botella entera y a dormir hasta la tarde. El sábado retomo. La vida se lleva así, un día a la vez, como los borrachos.
]]

T[5][4] = [[
Mayo — una noche.

Hoy pensé en ella por primera vez en meses. Mi ex. Se llamaba Diane. La dejé ser. No le escribí. No le llamé. Está en Florida, creo. Tiene hijos, creo. No míos. Nunca me perdonó que yo quisiera más al aire que a ella. Y no me lo perdonó porque tenía razón. El aire siempre fue lo mío. Cuando perdí el aire, también la perdí a ella, solo que ella ya se había ido antes.
]]

T[5][5] = [[
Junio — miércoles.

Tobías me dijo que Dios es mecánico. Lo estuve pensando. Hay algo en eso. Un mecánico mira el motor, lo desarma, lo vuelve a armar. No espera que el motor le rece. El motor funciona o no funciona. Me gusta esa idea de Dios. Un Dios que no quiere que le digan nada, que quiere que uno siga andando. Le voy a decir a Tobías la próxima vez.
]]

T[5][6] = [[
Julio — sábado.

El sedán se mueve tres metros solo. TRES METROS SOLOS. Hoy fue el primer día. Lo grabé con la cámara vieja de mi vecino. Después me senté al volante y manejé esos tres metros sin tocar nada, con las manos en las piernas, y me reí tan fuerte como no me reía desde la cabina de un 737. Si me muero mañana, que sepa el que encuentre esto: FUNCIONÓ.
]]

T[5][7] = [[
Agosto — domingo noche.

Esa sensación volvió. La del Atlántico. Hace trece años, y hoy, las dos veces. Como si el cielo me conociera. Como si yo tuviera un permiso especial. No sé explicarla. Ojalá creyera en algo para poder decirlo sin sentirme un idiota. Se la voy a contar a Tobías. Pero en el taller. Con café malo. Si no puedo en el taller con café malo, no puedo en ningún lado.
]]

T[5][8] = [[
Septiembre — dejaron un sobre.

Alguien entró al taller mientras yo estaba en el baño. Dejó un sobre sobre el banco. Adentro: una manzana, una placa de metal con el número 05, una nota a máquina. Me ofrecen cuarenta mil dólares por conducir un King Air tres millas por una pista privada. Me llaman "capitán". Capitán. Trece años sin oír esa palabra dirigida a mí. Con cuarenta mil dólares termino el sedán. Pero no es la plata. Es la palabra. No puedo rechazar la palabra. El domingo voy.
]]

T[5][9] = [[
[Nota en un pedazo de papel de taller, encontrada plegada en el tablero del sedán]

subí a la cabina por pura costumbre. ni siquiera era un trabajo de volar. solo conducir. toqué los instrumentos. olí el cuero. me senté. sentí la sensación otra vez, la del atlántico. y entonces una voz por atrás me dijo buen vuelo capitán y pinchazo en el cuello y se acabó. no tengo miedo. si alguien lee esto, el sedán funciona, está bajo la lona al fondo del taller, que lo use alguien que lo necesite. que vuele. R.M.
]]

T[5][10] = [[
[Última anotación, al final del manual del King Air, escrita sin ver]

ya no veo bien del otro ojo. escribo de memoria sobre el manual que me sé entero. el cielo no vino. vino un viejo. bueno. no es tan distinto. el cielo siempre fue una metáfora. hoy tobías me tomó la mano antes de dormirme. dijo una oración en voz baja. no entendí las palabras pero entendí la voz. capitán de qué, Tobías. de nada. capitán de haber volado. eso ya es bastante. buen vuelo.
]]

-- ============================================================================
-- SUJETO 06 — Daniel "Danny" Orozco (Profesor de Ed. Física)
-- ============================================================================
T[6] = {}

T[6][1] = [[
Lunes, 2 de febrero — 5:15 a.m.

Salí a correr como todos los lunes. El pueblo duerme. Me gusta cuando es así, cuando parece que el mundo es mío y de los panaderos. Sofía, hoy hace siete años. Lucía me preguntó ayer cómo eras. Le dije que eras la mejor. Le dije que cantabas mal. Se rió. Me mordí la parte de adentro del cachete para no llorar delante de ella. Después en la ducha sí. Siete años, amor. La estoy criando lo mejor que puedo.
]]

T[6][2] = [[
Jueves, 5 de marzo — tarea.

Lucía no entendía divisiones largas. Me acordé de ti, mamá, que eras contadora y te salían tan fáciles. Estuvimos hasta las once. Se durmió con la calculadora en la mano. Mañana tengo turno doble y el ojo me cierra solo. Pero valió la pena. Sacó un 6,8 en la prueba. Me abrazó fuerte. Ese abrazo lo meto en un frasco y lo abro cuando estoy a punto de caerme.
]]

T[6][3] = [[
Viernes, 10 de abril — la ortodoncia.

Hoy el ortodoncista me dijo que debo tres cuotas. Me dijo "Danny, a la niña no le puedo suspender el tratamiento, pero". Pero. Siempre hay un pero con la plata. Salí a la calle y casi lloro en el semáforo. Profesor de gimnasia estatal más turno nocturno igual no alcanza. Algo tiene que aparecer. Algo tiene que aparecer.
]]

T[6][4] = [[
Sábado, 25 de abril — la feria de Rosewood.

Lucía y yo paseando. Nos paramos en un puesto de un viejo que regalaba albahaca. Isaac se llama. Raro el tipo, amable pero raro, como si estuviera siempre pensando en otra cosa. Me preguntó por mí. Le conté a qué me dedicaba. Me dio la dirección de su casa en una servilleta y me dijo que pasara cuando quisiera. Lucía le agarró la mano de la nada y le dijo "usted huele a bosque". El viejo se rió. Yo también. Buen día.
]]

T[6][5] = [[
Miércoles, 3 de junio — la propuesta.

Fui donde Isaac por tercera vez. Me mostró el sótano. No te voy a mentir, cuaderno, me asusté un poco. Pero después me explicó. Me dijo que tenía algo que podía cambiarle la vida a la gente, que él era viejo, que necesitaba alguien que las distribuyera en el gimnasio, que él no cobraba ni una parte. Me ofreció plata para Lucía. Mucha. No le pregunté demasiado. Nos inventamos juntos la historia del tipo del estacionamiento por si alguien preguntaba. Me fui a casa con la primera caja y vomité en la vereda antes de entrar. Después le hice sopa a Lucía.
]]

T[6][6] = [[
Miércoles, 9 de septiembre — Claire.

Hoy una alumna del gimnasio, Claire, enfermera, se quedó sentada después de entrenar. Triste. Le saqué un trozo de la historia, no todo, pero suficiente. Enamorada de alguien que no es suyo. Le di una cápsula. No le cobré. Le dije algo de que si se quería a sí misma iba a ser más fácil. No sé por qué se lo dije. Me salió solo. Ojalá la pastilla la ayude. Ojalá yo sirva para alguna cosa buena aunque sea de rebote.
]]

T[6][7] = [[
Miércoles, 16 de septiembre — algo raro.

Claire volvió al gimnasio y me dijo que no le pasó nada con la pastilla. NADA. Llevo ocho meses vendiendo estas cosas y nunca alguien me dijo nada. Algo raro está pasando. Fui donde Isaac esa misma noche y le conté. El viejo me tranquilizó pero tenía los ojos distintos. Vine en el auto pensando una cosa fea: no sé qué estoy vendiendo en el gimnasio. Nunca supe. Lucía dormía cuando llegué. La miré un rato largo.
]]

T[6][8] = [[
Jueves, 29 de octubre — una foto de mi hija.

Llegó una caja. Manzana. Placa con el 06. Y una foto de Lucía saliendo del colegio, tomada hoy a la tarde, desde un auto. UNA FOTO DE MI HIJA. Vomité dos veces en el baño. Me amenazan con mandar otra foto el lunes. Tengo que ir solo mañana a un estacionamiento. Soy profesor de gimnasia. Tengo cuarenta kilos de ventaja sobre cualquier oficinista. Si es una pelea, peleo. Si me matan, peleo hasta el final. Lo único que necesito es que Lucía no esté en ningún cuadro. Lucía no. Lucía nunca.
]]

T[6][9] = [[
[Nota arrugada, encontrada en el asiento del auto abandonado]

si alguien encuentra esto: mi hija se llama Lucía Orozco, once años, está con la vecina Sra. Patterson en el edificio de calle Main 412. Avísenle a Servicios Sociales, mi prima Marta vive en Louisville, número en la agenda. que no vaya al estado, por favor. LUCÍA. LUCÍA. LUCÍA. soy Daniel Orozco y fui un buen padre. hice una cosa mal por ella. si al final le sirvió a ella, valió la pena. si no le sirvió, perdón.
]]

T[6][10] = [[
[Escrito semanas después, letra de alguien muy cansado]

supe en el galpón lo que estaba vendiendo. supe lo del compuesto. pensé en matar a Isaac con mis manos. no lo hice. no porque lo perdonara, sino porque Lucía no habría querido a un papá asesino. Isaac era útil para que los demás sobrevivieran un poco más, y yo elegí los demás sobre mi venganza. espero, hija, que hayas entendido de grande por qué hice lo que hice en el gimnasio, y por qué no maté al que me arruinó la vida cuando pude. espero que estés viva. te pienso cada minuto. si esto lo lee alguien que algún día te encuentre, dile que su papá la pensó hasta el final. hasta el último final.
]]

-- ============================================================================
-- SUJETO 07 — Dr. Isaac Volkov (Biólogo)
-- ============================================================================
T[7] = {}

T[7][1] = [[
Cuaderno XVIII, 4 de marzo.

La señora Kerr volvió hoy a llevarse dos kilos de tomates. Camina derecha. Hace un año no podía subir escaleras. Es la cuarta clienta que veo con mejoras que no deberían atribuirse a la dieta. Hay algo en los frutos que estoy produciendo. Marina, si todavía me escuchas, quiero que sepas que esto no era lo que planeaba. Pero ahora que lo veo, tampoco es algo que pueda dejar de ver.
]]

T[7][2] = [[
Cuaderno XIX, 12 de mayo.

Logré sintetizar el principio activo en una matriz de celulosa comprimida. Cápsulas. Cuarenta miligramos. Equivalente a un mes de consumo del huerto. Las primeras pruebas en voluntarios (yo incluido, dos semanas) muestran: aumento de energía sostenida, mejor visión nocturna, libido elevada, cambios en el olor corporal (feromonas, probable). Marina habría reído hoy. Le habría gustado.
]]

T[7][3] = [[
Cuaderno XX, 3 de junio — el profesor.

Un hombre joven se detuvo hoy en la feria. Instructor de gimnasia. Viudo. Una hija. Tiene el aire desesperado de los que necesitan algo. Le dije que pasara por casa. Puede ser él. Puede ser mi puente. No quiero vender. Pero necesito distribuir. Necesito ver qué hace el compuesto en cuarenta cuerpos distintos, no solo en uno. La ciencia no se hace sola.
]]

T[7][4] = [[
Cuaderno XX, 11 de julio — acuerdo.

Daniel aceptó. Inventamos una historia por si alguien pregunta, un hombre anónimo en un estacionamiento, una mafia canadiense. Es más creíble que la verdad. La verdad nunca es creíble. Él no quiere saber. Yo no quiero decirle. Marina, anoche lloré. No sé si por la niña de él, por mi miedo, o por estar cerca de algo que llevo cuarenta años buscando.
]]

T[7][5] = [[
Cuaderno XXI, 18 de septiembre — la enfermera.

Daniel vino esta noche. La clienta Vance no respondió al compuesto. Cero reacción. Esto es imposible, según mis datos. Cuarenta y un sujetos, cuarenta y una reacciones positivas. Vance es la excepción. Vance es, entonces, la evidencia de que existe la siguiente iteración. No es una falla del compuesto. Es un organismo más avanzado. Empiezo seguimiento mañana. Marina, creo que la encontré. Creo que encontré el siguiente escalón.
]]

T[7][6] = [[
Cuaderno XXI, 12 de octubre — seis.

He identificado seis sujetos con la misma marca biológica que Vance. Enfermera. Médico (su amante, por azar). Cajero de supermercado. Sacerdote. Mecánico. Profesor de gimnasia (sí, el propio Daniel). La probabilidad estadística de que seis individuos con esta rareza vivan en un radio de treinta millas es cero. Esto no es azar. Esto es biología dirigida. La humanidad está produciendo, de manera silenciosa, una siguiente fase. Y yo la he detectado antes que nadie.
]]

T[7][7] = [[
Cuaderno XXII, 30 de octubre — el galpón.

Tengo a los seis. El procedimiento fue limpio. Cebo personalizado para cada uno. Vance la más fácil. Hargreaves siguió a Vance, como predije. Delaney vino por su cuenta, el pobre. Cross por culpa. Malone por nostalgia. Orozco por la hija. Cada uno muerde su propio anzuelo. Estoy extrayendo muestras diarias. Versión 2 en preparación. Marina, duermo cuatro horas. Ya no te hablo en el porche. Hablo aquí. Perdón.
]]

T[7][8] = [[
Cuaderno XXII, 14 de noviembre — el octavo.

Identifiqué a un séptimo sujeto compatible. Séptimo, porque el grupo ahora es seis más yo, pero por fuera del grupo sería el séptimo y mi plan lo llama el octavo, así que octavo se queda. No lo voy a incluir en los experimentos. No puedo explicarlo racionalmente. Lo miré desde un auto estacionado y algo en mí se quebró. No voy a tocarlo. Voy a hacer la única cosa buena que puedo hacer a esta altura. Lo voy a proteger. Marina, si sigues ahí: ayúdame a hacer esto bien.
]]

T[7][9] = [[
Cuaderno XXIII, 21 de noviembre — la cabaña.

Lo sedé con el retrógrado de memoria. Seis meses completos borrados. Lo llevé a la cabaña del río Jefferson. Cargué provisiones para un año. Tranqué las puertas. Le escribí una nota con lo mínimo. Volví a casa manejando despacio. Esta noche entrego la versión 2 al contacto. Sé que algo no está bien en los últimos resultados. Hay una inestabilidad proteica que no logro explicar. Pero el contacto presiona. Firmé hace meses. Marina, perdóname. Si esto sale mal, la única cosa limpia que voy a haber hecho fue la cabaña.
]]

T[7][10] = [[
[Cuaderno XXIII, última entrada — después del galpón, antes de escribir la carta para los dog tags]

Mis manos ya no obedecen del todo. Debo escribir rápido. Me equivoqué. No era una evolución. Era una enfermedad con síntomas de grandeza. Los mordidos no evolucionan: se pierden. Y yo lo entendí tarde. Los siete de mi galpón son mi culpa, y yo estoy entre los siete, y eso es una justicia minúscula pero es la única que podía conseguir. Voy a escribir ahora la última nota, la que va en los dog tags. Voy a pedirles a los seis que decidan ellos. Yo no puedo decidir más. Marina. Marina. El puente pasa solo. Ahora entiendo lo que me dijiste. Nunca fue metáfora. Una sola persona pasa. El resto se queda del lado del que empezó. Adiós.
]]
