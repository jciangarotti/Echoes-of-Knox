-- Echoes_Diaries_ES.lua: version espanola (chilena) de los headers y textos
-- de los 70 diarios. Carga alfabeticamente despues de Echoes_Diaries.lua y
-- popula Echoes.Diaries.HEADERS_ES y Echoes.Diaries.TEXTS_ES. Se elige
-- runtime segun Echoes.getLang(). Espanol en variante chilena: tu + conju-
-- gaciones estandar, sin rioplatense (vos/queres/sabes).

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
    role = "Medico Internista",
    source = "Libreta de cuero marron encontrada en un cajon del consultorio de urgencias del Hospital de Riverside. Paginas sueltas, algunas en hojas de recetario. Letra de doctor.",
}

H[2] = {
    name = "Claire Vance",
    role = "Enfermera Titulada",
    source = "Cuaderno escolar tapa azul, rayado, con una calcomania de una margarita medio despegada. Departamento arriba de la panaderia de Muldraugh. Boligrafos de distintos colores.",
}

H[3] = {
    name = "Marcus \"Buck\" Delaney",
    role = "Cajero y Reponedor de Supermercado",
    source = "Libreta de espiral del Zippee Dee Mart, a lapiz. Manchas de cafe. Letra imprenta grande, muchas exclamaciones.",
}

H[4] = {
    name = "Padre Tobias Cross",
    role = "Sacerdote Catolico",
    source = "Diario espiritual de tapa dura negra, parroquia Saint Anne, Rosewood. La primera pagina dice A.M.D.G. Las entradas suenan mas a confesion que a oracion.",
}

H[5] = {
    name = "Rhett \"Hawk\" Malone",
    role = "Mecanico Automotriz (ex-piloto)",
    source = "Anotaciones en los margenes de un manual de vuelo Beechcraft King Air de 1978, a lapiz de taller. Frases cortas. Muchas tachaduras. Las ultimas entradas, en cambio, se alargan. Como si al final hubiera tenido algo que decir.",
}

H[6] = {
    name = "Daniel \"Danny\" Orozco",
    role = "Profesor de Educacion Fisica",
    source = "Planillas de asistencia del gimnasio Iron Will, dobladas en cuatro, escritas por el dorso. Manchas de sudor. Letra de madrugada.",
}

H[7] = {
    name = "Dr. Isaac Volkov",
    role = "Biologo, ex-investigador agroindustrial, agricultor independiente",
    source = "Cuadernos numerados de tapa dura, del I al XXIII, sotano de la casa de Rosewood. Letra de cientifico, precisa al principio, temblorosa hacia el final. Dos idiomas, ingles y ruso, a veces en la misma linea.",
}

-- ============================================================================
-- SUJETO 01 - Dr. Elliot Hargreaves (Medico)
-- ============================================================================
T[1] = {}

T[1][1] = [[
Martes, 3 de noviembre.

Perdi hoy a un paciente de sesenta y ocho anos, infarto masivo, no habia nada que hacer. Margaret me pregunto como habia estado el dia y le dije que bien. Le dije bien. Despues me fui al estudio y me servi un whisky y estuve una hora mirando la pared. Hace cuanto que le miento a mi mujer por cosas que no son siquiera mentiras, sino cansancios que no se como contarle. Los ninos dormian. Tomas tenia la boca abierta como cuando era chico. Sophie abrazaba al oso. A veces pienso que esta es la vida que elegi, y que esta bien. A veces no.
]]

T[1][2] = [[
Viernes, 13 de noviembre.

Entro una enfermera nueva esta semana. Claire. Le ensene a entubar a un nino con crup y se le quedaron las manos temblando una hora despues, no por el miedo, por la adrenalina. Se rio sola en el pasillo. Me miro. Yo la mire. No paso nada. Pero algo paso. No voy a escribir esto en ningun lado serio. Anoto aqui porque necesito dejarlo en alguna parte.
]]

T[1][3] = [[
Miercoles, 27 de enero.

Le compre un telefono. Prepago, pequeno, uno de esos que caben en una cartera chica. Lo active a nombre de una paciente que murio hace meses y que nunca dio de baja la linea. Pague en efectivo en West Point para que no quedara en mis tarjetas. Dios, escucharme. Hablo como un estafador. Me paso la vida operando gente y resulta que la mentira mas compleja que aprendi a hacer fue comprarle un celular a una mujer que no es mi esposa.
]]

T[1][4] = [[
Sabado, 11 de abril.

Louisville. Cuatrocientos dolares en una mesa de blackjack y los gastamos todos en una noche como si fueramos jovenes. Claire se compro unos zapatos que nunca va a poder usar en el hospital. Yo comi una cosa francesa cuyo nombre no pude pronunciar. Volvimos por la 65 a las cinco de la manana con la radio fuerte, las ventanas abiertas, el aire frio, y yo manejaba con una mano y la otra sobre su rodilla, y ella dormia con la boca entreabierta contra el vidrio. Pense que ojala esa carretera no terminara nunca. Despues me acorde de Margaret y Tomas y Sophie y me dio un vacio en el estomago. Pero la carretera siguio. Y yo segui.
]]

T[1][5] = [[
Jueves, 2 de julio.

Hoy atendi a una nina en urgencias, caida en bicicleta, nueve anos, brazo fracturado. El padre estaba desesperado, tipo joven, musculoso, profesor de gimnasia o algo asi. Le sostenia la mano a la nina en la sala de espera como si fuera a caersele. Me quede pensando en esa imagen. En el padre y en la hija. En lo que significa ser el que espera afuera. Yo siempre estoy del otro lado de la puerta. No se si alguna vez podria ser el que espera.
]]

T[1][6] = [[
Sabado, 15 de agosto.

Escribi una carta. No pienso mandarla. Le digo a Claire que el verano que viene voy a dejar a Margaret. Que le voy a dar tiempo a los ninos, que voy a buscar un departamento en Louisville, que vamos a empezar de nuevo. La guarde doblada dentro del libro de anatomia de Netter, tomo 2, pagina de la region pelvica, por un chiste privado que ella entenderia. No le voy a mandar la carta porque no estoy seguro. Pero tampoco la rompi. Eso tambien es una respuesta, supongo.
]]

T[1][7] = [[
Viernes, 11 de septiembre.

Hoy una colega me dijo, medio en broma, medio no, que llevo un ano mas contento de lo normal. Que se me nota. No supe que contestar. Despues en el estacionamiento escuche a dos enfermeras hablando y una le decia a la otra "a la Vance tambien la veo distinta". Se me helo algo adentro. Despues se me calento. Despues me di cuenta de que habia sonreido solo, en el auto, como un idiota.
]]

T[1][8] = [[
Sabado, 3 de octubre - Claire no aparecio.

Llame al telefono escondido trece veces. No contesta. Fui a Muldraugh. El departamento esta cerrado. La panadera de abajo me dijo que no la ve desde el viernes. Tuve que sentarme en la escalera para no vomitar. Volvi al hospital y pregunte disimuladamente. Nadie sabe nada. No puedo hacer mas. No puedo poner su cara en un cartel de desaparecida. No puedo decirle a la policia que la busco porque soy su amante. Margaret me pregunto en la cena si me sentia bien. Le dije que habia perdido un paciente. Otra vez.
]]

T[1][9] = [[
Jueves, 8 de octubre - el Iron Will.

Fui al gimnasio donde ella entrena. Nada. El recepcionista me miro raro. Habia un viejo en la cafeteria del frente que me quedo mirando, barba blanca, libro en la mano. No lo reconoci. Despues pense que quizas si, que me sonaba de alguna conferencia vieja, pero me lo saque de la cabeza. Hoy no tengo cabeza para caras. Hoy solo tengo cabeza para una cara.
]]

T[1][10] = [[
Viernes, 16 de octubre - llego un paquete.

Margaret lo dejo en la entrada. Sin remitente. Lo abri en el bano con la puerta cerrada. Una manzana roja. Una placa de metal con un numero: 02. Y una nota de ella, mi Claire, su letra, diciendome que esta viva, que la espero manana a las seis en la cabana del lago. La cabana del lago. Solo ella y yo sabemos lo de la cabana del lago.

Me colgue la placa bajo la camisa ahora mismo. Margaret esta durmiendo. Manana le voy a decir que tengo un congreso en Lexington, le voy a dar un beso, voy a manejar hasta ahi y la voy a abrazar. Esta viva. Dios, esta viva.

Si esta es la ultima vez que escribo en esta libreta porque la proxima vez ya estoy con ella y empieza todo de nuevo, esta bien. Esta muy bien.
]]

-- ============================================================================
-- SUJETO 02 - Claire Vance (Enfermera)
-- ============================================================================
T[2] = {}

T[2][1] = [[
Domingo, 8 de marzo.

Hoy fui a ver a mama al hogar. Estaba mejor. Me reconocio. Me pregunto por papa, como si papa no hubiera muerto hace quince anos. Le dije que estaba trabajando. A veces es mas facil mentirle que explicarselo otra vez. La enfermera del hogar me dijo que hoy mama habia cantado una cancion en el almuerzo, una que yo no conocia. Me fui manejando escuchando la radio sin radio. Doc me recibio maullando como si hubiera pasado un mes. Le di atun. Me servi una copa de vino. Hoy es domingo y estoy cansada y es una tristeza vieja la que tengo, no una nueva.
]]

T[2][2] = [[
Martes, 17 de marzo.

Hoy en el turno un medico me enseno a entubar a un nino con crup. Se llama Hargreaves. Tiene canas y ojos marrones y se le queda la mano sobre el hombro del paciente una fraccion de segundo mas de lo necesario. Cuando me explico el procedimiento me miro como si yo fuera la unica persona en la sala. Despues no paso nada. Pero en el ascensor de vuelta al piso me di cuenta de que me habia arreglado el pelo y ni siquiera sabia cuando.
]]

T[2][3] = [[
Sabado, 2 de mayo.

Pasamos la noche en un motel de West Point. Nombres falsos. El puso "John Smith" y yo me rei tanto que casi no pude entrar al lobby. Despues fue menos gracioso. Despues fue hermoso. Despues fue culpa. Vuelvo a casa en el auto y pienso en su esposa, Margaret, que no conozco pero tiene nombre. Pienso en sus hijos. Pienso en mi. No puedo seguir. Manana le digo. Manana le digo. Escribo "manana le digo" y se que no le voy a decir nada. Doc me mira como si supiera. Gato traidor.
]]

T[2][4] = [[
Jueves, 18 de junio - taller de ceramica.

Termine una taza hoy. Fea pero terminada. La profesora me dijo que tengo manos de enfermera, que no les tengo miedo al barro. Me rei. Me gusto. Voy a regalarsela a el, que tonteria, una taza para un hombre casado, pero voy a hacerlo igual. La proxima semana hago otra para mama.
]]

T[2][5] = [[
Domingo, 30 de agosto - el almacen de West Point.

Hoy pase por el Zippee Dee Mart a comprar leche y el cajero, un senor flaco con barba canosa y gorra de los Cardinals, me puso una manzana en la bolsa sin cobrarmela. Me dijo "para la enfermera linda". Me dio ternura. Me comi la manzana caminando, despues del turno, antes de ir al departamento donde el me esperaba. Lo que no sabe el cajero es que las manzanas son importantes en mi vida de una manera rara que no le puedo explicar a nadie. Gracias, senor Cardinals.
]]

T[2][6] = [[
Miercoles, 9 de septiembre - Danny.

Hoy en el gimnasio me quede en la banca despues del entrenamiento. Danny, el profe, se sento al lado. Le termine contando cosas que no le cuento a nadie. No todo. Pero bastante. Es buen tipo. Me dio una capsula rara y me dijo que me ayudaria a sentirme mejor conmigo misma. Lo vi con tanta buena fe que no tuve corazon para no aceptarla. La tengo en el bolsillo del jean. No se si la voy a tomar. Puede que si.
]]

T[2][7] = [[
Miercoles, 9 de septiembre - nota de la noche.

Me la tome. Espere. Me mire en el espejo buscando algo. No senti nada. Vino el. Todo fue igual. Todo fue exactamente igual que siempre. Y fue ahi, mientras el dormia y yo miraba el techo, que entendi algo. No quiero seguir siendo la otra. No quiero mas codigos, ni manzanas en escritorios, ni nombres falsos. La pastilla no me hizo nada en el cuerpo. Pero me hizo algo en la cabeza. Le voy a pedir que la deje. Esta vez va en serio.
]]

T[2][8] = [[
Viernes, 2 de octubre - llego un paquete.

Una caja en la puerta esta manana. Sin remitente. Manzana roja. Placa de metal con el numero 01 grabado. Y una nota: "Para que no tengas que esconderlo mas. Te espero esta noche en el motel del kilometro 12. Voy a dejarla." Es el. Tiene que ser el. Nadie mas en el mundo diria esa frase. Llore diez minutos en el piso de la cocina y no fue de tristeza, fue de alivio. Despues de tres anos. Me colgue la placa bajo la blusa y me la deje contra la piel. Voy a ir esta noche. Si esta es la ultima pagina antes del resto de mi vida, bueno. Que empiece el resto. Doc, portate bien. Vuelvo manana.
]]

T[2][9] = [[
[Sin fecha - escrito a lapiz en una servilleta encontrada en su bolsillo]

me duele todo. hay un viejo. no es el. me duele la cabeza. si alguien encuentra esto por favor avisenle a elliot. el sabe donde vivo. el sabe quien soy. doc esta solo. por favor el gato.
]]

T[2][10] = [[
[Papel doblado en cuatro - escrito meses despues, letra temblorosa]

Ya no escribo mucho. Me tiemblan las manos y las venas se me ven negras hasta los dedos. Pero hoy le escribi una carta larga a alguien que no conozco y senti, por primera vez desde el motel, que estaba haciendo algo bien. Eramos siete alrededor de un auto y firmamos todos. Le deje la caja en la puerta y no mire atras.

Elliot me apreto la mano cuando volvi. No dijo nada. No hacia falta.

Espero que ese alguien lea esto algun dia y entienda que nosotros tambien fuimos gente, antes. Fuimos gente que quiso a otras personas. Fuimos gente que comio manzanas en las cocinas. Fuimos gente. Nada mas.
]]

-- ============================================================================
-- SUJETO 03 - Marcus "Buck" Delaney (Cajero)
-- ============================================================================
T[3] = {}

T[3][1] = [[
Lunes, 4 de mayo.

Hoy Fign se subio al hombro mientras yo leia el diario y se quedo ahi toda la media hora del cafe. Rufus gruno celoso. Les dije a los dos que hay Buck para todos. Rufus no lo entendio pero se echo a mis pies igual. Fign me robo un pedacito de la galleta. Son mis hijos, estos dos. No los cambio por nada.
]]

T[3][2] = [[
Jueves, 21 de mayo - la luz.

ANOCHE VI UNA LUZ. Sobre los arboles al sur. No era avion, no era satelite, no era luna. Estuvo quieta como quince minutos y despues se fue sin moverse, como si se hubiera apagado. La tercera en mi vida. Le conte hoy a la senora Henderson, me dijo "Buck, otra vez", se rio, compro pan. Yo ya me acostumbre. Pero esta vez era distinto. Esta vez senti que era por mi. Que estaban viendo si yo estaba listo. Fign se desperto y se metio debajo de la cama y no salio hasta la manana. Los animales saben.
]]

T[3][3] = [[
Sabado, 6 de junio - la enfermera linda.

Entro al almacen una chica que viene seguido, castana, ojos cansados, se ve que trabaja en el hospital. Hoy traia cara de tres turnos seguidos. Le puse una manzana en la bolsa sin cobrarsela. Le dije "para la enfermera linda". Se sonrio. Me acorde de mi tia Edith cuando yo era chico. Hay gente que necesita una manzana mas que otra. Uno las va dando como puede.
]]

T[3][4] = [[
Martes, 16 de junio - el padre Cross.

Paso el padre Tobias a comprar cafe. Le conte lo de la luz. Se quedo callado mas de lo que se queda callada la gente educada. Despues me dijo "cuidate, Buck", y se fue mirando a la calle vacia. A ese cura le pasan cosas. No como a mi. Cosas distintas. Cosas mas tristes. Un dia me voy a animar a preguntarle.
]]

T[3][5] = [[
Domingo, 28 de junio - Fign y la ardilla del vecino.

Fign se peleo con una ardilla del patio del senor McKenzie. Gano Fign. Volvio con una oreja rota y la dignidad intacta. Le cure con un algodon. Me mordio la oreja suavecito cuando termine. Es su manera de dar las gracias. Rufus se hizo el dormido todo el episodio. Ese perro es un cobarde divino.
]]

T[3][6] = [[
Miercoles, 8 de julio - los suenos.

Tres noches seguidas sonando lo mismo. Estoy parado en el medio de un claro en el bosque. Arriba no hay luna, hay algo mas. No puedo moverme pero no tengo miedo. Una voz me dice "ya falta poco, Marcus". Me despierto y estoy tranquilo. Nadie me llama Marcus desde que se murio mama.
]]

T[3][7] = [[
Viernes, 31 de julio - ojos.

HOY SENTI OJOS EN LA NUCA TODO EL DIA. En el almacen, en la camioneta, en la casa. No es paranoia. Es atencion. Alguien mira. Lo siento en los omoplatos como un frio. Rufus gruno a un rincon del living donde no habia nada. Fign se quedo quieta, mas quieta que nunca, sobre la cortina. Los tres sabiamos. No se quien nos mira. Pero que sepa que estoy listo.
]]

T[3][8] = [[
Martes, 15 de septiembre - llego el paquete.

LLEGO. LLEGO. Una caja en el mostrador esta tarde. Sin remitente. Adentro una manzana roja y una placa de metal con mi nombre y el numero 03. Y una nota que dice "Marcus, llego el momento. Sabiamos que estabas listo". CINCUENTA Y DOS ANOS. Cincuenta y dos anos diciendolo y nadie creyendome. Hoy llore detras de la caja registradora con Rufus a los pies. Pero no de tristeza. De orgullo. Esta noche voy al claro. Les dejo comida a Rufus y a Fign para tres dias. Si vuelvo, les cuento. Si no vuelvo, que sepan que fui feliz.
]]

T[3][9] = [[
[Nota pegada al refrigerador, letra cuidadosa]

RUFUS come a las 7 y a las 6. No mas. Esta gordito. Las pastillas del corazon en el bote amarillo, una cada manana. FIGN come nueces peladas (NO con cascara, se atraganta), frutillas de vez en cuando. La llave del buzon esta en la lata de cafe. Si esta vez no vuelvo, los quiero a los dos. No me esperen. Hubo alguien que vino a buscarme y yo sabia que iba a venir. Vecino Henderson, por favor pasa a darles de comer. Gracias. Marcus.
]]

T[3][10] = [[
[Hoja suelta, meses despues, letra torcida]

escribo mal. me cuesta. estoy con los otros seis. son buena gente. el cura me cuida. el doctor tambien. el mecanico habla poco y yo hablo por dos asi que estamos bien. no fueron los marcianos, escribo esto para el Buck de antes que se lo merece saber. no fueron los marcianos. fue un viejo con un huerto que se equivoco. pero igual me eligieron. igual me vieron. yo tenia razon toda la vida y eso me lo llevo. rufus si estas vivo perdon. fign si estas viva perdon. me sacaron sangre pero me dejaron el corazon. buck de antes, duerme tranquilo, tuviste razon.
]]

-- ============================================================================
-- SUJETO 04 - Padre Tobias Cross (Sacerdote)
-- ============================================================================
T[4] = {}

T[4][1] = [[
Domingo, 12 de marzo - aniversario de Ellie.

Dieciocho anos hoy. Celebre la misa de las nueve como siempre. Nadie en el pueblo sabe que dia es hoy para mi. Despues, en la sacristia, me arrodille y le pedi perdon a ella, no a Dios. Dios me perdona por oficio. Ellie no esta. Y eso es lo que no se cura. Esta noche paso por la esquina de la casa donde murio. Ya no me detengo. Hace anos que no me detengo. Pero pasar, paso.
]]

T[4][2] = [[
Jueves, 2 de abril - la prision.

Los miercoles sigo yendo a la prision. Hoy confese a un muchacho de Rosewood que mato a su mujer a golpes. Tiene veintiseis anos. Llora como un nino. Le di la absolucion y senti, al hacerlo, que me la estaba dando a mi mismo. Dios, perdoname. No por los pecados que cometi. Por los pecados que sigo cometiendo cada vez que me dejo querer por esta gente que no sabe quien fui.
]]

T[4][3] = [[
Viernes, 24 de abril - Hawk.

Lleve el Plymouth al taller. Hawk me recibio con su cafe negro. Hablamos tres horas. El no cree en Dios. Yo no le creo mucho a lo de no creer. Nos reimos. Me dijo que si Dios existe es ingeniero, no poeta. Le dije que yo lo creo mecanico. Se quedo pensando dos dias, despues me mando un mensaje: "capaz que tiene razon, padre". Con Hawk no hablo de Ellie. No hablo de nada que importe de verdad. Pero hablo, y es lo mas parecido a un amigo que he tenido desde entonces.
]]

T[4][4] = [[
Domingo, 10 de mayo - Isaac.

Hoy vino Isaac a dejarme hierbas para los enfermos. Hace anos hace esto. No se mucho de el, salvo que es viudo y habla poco. Pero lo vi cansado hoy. Mas que cansado. Aparento normalidad pero tenia los ojos de alguien que esta cargando una cosa muy grande. Le pregunte si queria confesarse. Se rio sin ganas y me dijo "padre, si me confieso le arruino la semana". Lo abrace. Nunca nadie se ha puesto tan rigido en un abrazo mio. Rezo por el esta noche.
]]

T[4][5] = [[
Miercoles, 17 de junio - Buck y la luz.

Buck me conto que vio otra luz en el cielo. Sobre los arboles al sur. Me quede callado. En esta parroquia, en las noches de vigilia, yo tambien he sentido cosas que no cuadran con nada que me ensenaron en el seminario. No hablo de eso con nadie. Pero cuando Buck me conto lo suyo, me dieron ganas de decirselo. Me contuve. Le dije "cuidate, Buck". Ojala algun dia me anime.
]]

T[4][6] = [[
Martes, 7 de julio - el sueno.

Sone con Ellie. Pero no con la Ellie de los ultimos anos. Con la Ellie de los nueve, la que me seguia al patio con las trenzas chuecas. Me decia "Toby, levantate que vamos a llegar tarde". Me desperte llorando. Hace una decada que no sueno con ella asi. Me pregunte que significa. Me pregunte si Dios esta avisandome algo. Despues me pregunte si Dios avisa, o si solamente espera.
]]

T[4][7] = [[
Sabado, 1 de agosto - un preso.

Hoy en la prision me paso algo raro. Un guardia me miro mas tiempo del necesario. Me parecio, por un segundo, que sabia. No puede saber. Nadie sabe salvo los tres que estan en la carcel por lo que paso, y Hank nunca hablo. Nunca va a hablar. Pero esa mirada me quedo en el cuerpo todo el dia. Dios, si quieres que mi secreto salga, que salga. Pero dame el valor de no huir cuando lo haga.
]]

T[4][8] = [[
Jueves, 22 de octubre - llego una carta.

Dejaron una caja en la sacristia. Sin remitente. Manzana roja, placa con el numero 04, y una carta larga escrita a maquina. Es de Hank. Dieciocho anos sin saber de el. Dice que quiere confesarse conmigo antes de morir. Dice que un guardia le va a dejar abierta la puerta lateral del pabellon B el sabado a las cuatro de la manana. Que vaya solo. Lo estuve rezando tres horas arrodillado. Tengo miedo. Pero tambien tengo algo mas grande que el miedo. Esto es lo que he esperado dieciocho anos. Este es el tribunal de Dios que me corresponde. Voy a ir.
]]

T[4][9] = [[
[Hoja arrancada de una Biblia, escrita al margen de Mateo 6]

no era Hank. no era nadie. la puerta se cerro detras. me quede sin oleos, sin estola, solo con la cajita. un viejo me dijo que iba a hacer de mi algo importante. me saco sangre. me hablo de ciencia. yo rezaba fuerte en mi cabeza para que le diera verguenza a el, no a mi. Ellie, si estas mirando desde donde estes, no es venganza lo que quiero. Ya no. Solo quiero que termine.
]]

T[4][10] = [[
[Nota encontrada junto a los otros diarios, escrita con mano que apenas obedece]

Dios me permitio dos cosas hermosas al final. La primera fue perdonar al viejo que nos uso. No por el. Por mi. La segunda fue escribir, con los otros seis, una carta para alguien que no conozco. No le pusimos nuestros pecados. Le pusimos nuestros nombres. Espero que sea suficiente. Senor, que cuando mi cuerpo deje de ser mi cuerpo, mi alma ya este contigo y no adentro de lo que viene. Amen.
]]

-- ============================================================================
-- SUJETO 05 - Rhett "Hawk" Malone (Mecanico)
-- ============================================================================
T[5] = {}

T[5][1] = [[
Enero - sin dia.

Empece el proyecto del sedan. Ford del 71. Le adapte un sistema que lei en una revista vieja de avionica. Si funciona, va a conducirse solo. Si no funciona, tiro todo por el barranco y me rio. No me lo voy a decir en voz alta, pero este proyecto me esta salvando el invierno.

Ayer vi otro flash, el numero veintitantos de este ano. Un cliente nuevo que no conocia entro al taller dos dias despues. Me temblaron las manos cuando lo reconoci. El no se dio cuenta.
]]

T[5][2] = [[
Marzo - sin dia.

Vino Tobias con el Plymouth. Ese auto es un cadaver y el lo sabe y yo lo se, pero los dos hacemos como si lo estuvieramos salvando. Dos tazas de cafe malo. Me pregunto si creia en algo. Le dije que si, en los motores. Se rio. No le dije lo otro. Lo otro es para mi.
]]

T[5][3] = [[
Abril - martes.

Vista peor. Hoy confundi una 10mm con una 11mm y eso ya es un problema. A los clientes les dije que tenia arena en los lentes. Adentro me vine abajo. Mi vista se esta deteriorando mucho.
]]

T[5][4] = [[
Julio - sabado - FLASH 1.

ME PASO ALGO ENORME. Estaba ajustando un servomotor del sedan, debajo del volante, y se me fue la vista y me entro un flash largo, larguisimo, de dos segundos que fueron una hora. Me vi a MI MISMO manejando el sedan en una carretera vacia, flaco, sucio, rapido. Al lado iba un cura. Si. Un cura de Rosewood, que yo no conozco, que jamas en la vida me subi con el a ningun auto. Con la sotana rota. Gritandome algo. Detras corria gente. Gente que corria mal. Sali del flash golpeandome la cabeza contra el volante y vomite al costado del taller. Esto no es un flash cualquiera. Esto es algo grande. Esto es algo feo.
]]

T[5][5] = [[
Julio - domingo - FLASH 2.

Fui a misa. Por primera vez desde que murio mama. Maneje hasta Rosewood, entre a Saint Anne, me sente al fondo. Cuando salio el cura al altar casi me caigo. Era el. Era exactamente el. Me quede hasta el final y despues me acerque a hablarle. Le dije mentiras amables, que si nos conociamos, que si habia llevado algun auto al taller. Me contesto con educacion. No, no nos conociamos, nunca. Volvi manejando despacio y con miedo a mi mismo. Tobias, si algun dia lees esto, te pido perdon por adelantado. No se que vamos a vivir juntos. Pero vamos a vivir algo. Y no va a ser bonito.
]]

T[5][6] = [[
Agosto - jueves - FLASH 3.

Fui a Riverside a buscar un repuesto. Iban por la vereda de enfrente un hombre y una mujer, caminando cerca pero sin tocarse. No los conocia. Me entro un flash. Vi al mismo hombre, de rodillas frente a ella, diciendole "vamos a estar juntos toda la vida, hasta que la muerte nos separe". Dos segundos. Me quede duro. Me di vuelta para verlos mejor y ELLOS se dieron vuelta tambien, pero para separarse. Ella entro a la clinica. El cruzo la calle para la otra vereda. Como si no se conocieran. Como si tuvieran coreografia para eso. Entendi ahi una cosa: los flashes no siempre son el futuro. A veces son el secreto.
]]

T[5][7] = [[
Septiembre - lunes - FLASH 4.

Entro al taller un tipo con una moto con perdida de aceite. Profesor de gimnasia. Le di la mano y me entro un flash con el contacto. AHORA VIENEN POR CONTACTO. Lo vi sentado en una banca de gimnasio junto a la misma mujer de Riverside, la de la pareja secreta. Le ponia una capsula blanca en la mano y le decia algo al oido. No escuche las palabras pero las senti feas. Lo eche del taller. Casi le grite. Dejo la moto ahi tirada, llena de aceite. Me encerre y llore de rabia. Por que me muestran estas cosas? Para que las evite? Para que las entienda? O solo para joderme?
]]

T[5][8] = [[
Septiembre - miercoles - EL DESMAYO.

Saque los datos del tipo de la moto. Daniel Orozco. Iron Will de West Point. Fui a buscarlo para preguntarle que capsula era esa, que mujer era esa, que mierda estaba pasando. No entre al gimnasio. En la vereda de enfrente habia un viejo con barba blanca saliendo de una cafeteria. Lo mire. El me miro. Y me entro el flash mas largo de mi vida. Casi una pelicula. Un galpon con luces fluorescentes. Siete camillas. Sondas. Yo en una de ellas. El cura en otra. El profesor en otra. La mujer. Su amante. UN CAJERO VIEJO QUE NO CONOZCO. Y el viejo de barba blanca. El mismo viejo que estaba parado a tres metros. PERO EN EL FLASH EL VIEJO NO ERA EL QUE ENCERRABA A LOS OTROS. ERA UNO DE LOS ENCERRADOS. Me empezo a sangrar la nariz. Me desmaye en la vereda. Desperte en un hospital. El parte decia crisis vasovagal. Pura mierda.
]]

T[5][9] = [[
Septiembre - viernes - acepto el trabajo.

Tuve anoche otro flash. Yo subiendome a un King Air. Una voz diciendome "buen vuelo capitan". Un pinchazo. Negro. Entendi que pase lo que pase voy a terminar ahi. Hoy llego un paquete al taller con una manzana, una placa con el numero 05 y una carta que me ofrece lo del King Air. Si es inevitable, que sea caminando yo hacia eso, no que vengan a buscarme a casa mientras duermo. Voy a ir. El sedan queda cubierto con la lona. Si alguien lo encuentra, que sepa: funciona. Tres metros los manejo solo. Era poco pero era suficiente. Ojala alguien lo use. Ojala sirva para algo. Los flashes no fueron mentira. Siempre supe a donde iba.
]]

T[5][10] = [[
[Ultima anotacion, al final del manual del King Air, escrita sin ver]

ya no veo bien del otro ojo. escribo de memoria sobre el manual que me se entero. el cielo no vino. vino un viejo. bueno. no es tan distinto. el cielo siempre fue una metafora. hoy tobias me tomo la mano antes de dormirme. dijo una oracion en voz baja. no entendi las palabras pero entendi la voz. la vision del galpon se cumplio y el viejo estaba con nosotros como uno mas. yo tenia razon otra vez y ojala no la hubiera tenido. capitan de que, Tobias. de nada. capitan de haber visto. eso ya es bastante. buen vuelo.
]]

-- ============================================================================
-- SUJETO 06 - Daniel "Danny" Orozco (Profesor de Ed. Fisica)
-- ============================================================================
T[6] = {}

T[6][1] = [[
Lunes, 2 de febrero - 5:15 a.m.

Sali a correr como todos los lunes. El pueblo duerme. Me gusta cuando es asi, cuando parece que el mundo es mio y de los panaderos. Sofia, hoy hace siete anos. Lucia me pregunto ayer como eras. Le dije que eras la mejor. Le dije que cantabas mal. Se rio. Me mordi la parte de adentro del cachete para no llorar delante de ella. Despues en la ducha si. Siete anos, amor. La estoy criando lo mejor que puedo.
]]

T[6][2] = [[
Jueves, 5 de marzo - tarea.

Lucia no entendia divisiones largas. Me acorde de ti, mama, que eras contadora y te salian tan faciles. Estuvimos hasta las once. Se durmio con la calculadora en la mano. Manana tengo turno doble y el ojo me cierra solo. Pero valio la pena. Saco un 6,8 en la prueba. Me abrazo fuerte. Ese abrazo lo meto en un frasco y lo abro cuando estoy a punto de caerme.
]]

T[6][3] = [[
Viernes, 10 de abril - la ortodoncia.

Hoy el ortodoncista me dijo que debo tres cuotas. Me dijo "Danny, a la nina no le puedo suspender el tratamiento, pero". Pero. Siempre hay un pero con la plata. Sali a la calle y casi lloro en el semaforo. Profesor de gimnasia estatal mas turno nocturno igual no alcanza. Algo tiene que aparecer. Algo tiene que aparecer.
]]

T[6][4] = [[
Sabado, 25 de abril - la feria de Rosewood.

Lucia y yo paseando. Nos paramos en un puesto de un viejo que regalaba albahaca. Isaac se llama. Raro el tipo, amable pero raro, como si estuviera siempre pensando en otra cosa. Me pregunto por mi. Le conte a que me dedicaba. Me dio la direccion de su casa en una servilleta y me dijo que pasara cuando quisiera. Lucia le agarro la mano de la nada y le dijo "usted huele a bosque". El viejo se rio. Yo tambien. Buen dia.
]]

T[6][5] = [[
Miercoles, 3 de junio - la propuesta.

Fui donde Isaac por tercera vez. Me mostro el sotano. No te voy a mentir, cuaderno, me asuste un poco. Pero despues me explico. Me dijo que tenia algo que podia cambiarle la vida a la gente, que el era viejo, que necesitaba alguien que las distribuyera en el gimnasio, que el no cobraba ni una parte. Me ofrecio plata para Lucia. Mucha. No le pregunte demasiado. Nos inventamos juntos la historia del tipo del estacionamiento por si alguien preguntaba. Me fui a casa con la primera caja y vomite en la vereda antes de entrar. Despues le hice sopa a Lucia.
]]

T[6][6] = [[
Miercoles, 9 de septiembre - Claire.

Hoy una alumna del gimnasio, Claire, enfermera, se quedo sentada despues de entrenar. Triste. Le saque un trozo de la historia, no todo, pero suficiente. Enamorada de alguien que no es suyo. Le di una capsula. No le cobre. Le dije algo de que si se queria a si misma iba a ser mas facil. No se por que se lo dije. Me salio solo. Ojala la pastilla la ayude. Ojala yo sirva para alguna cosa buena aunque sea de rebote.
]]

T[6][7] = [[
Miercoles, 16 de septiembre - algo raro.

Claire volvio al gimnasio y me dijo que no le paso nada con la pastilla. NADA. Llevo ocho meses vendiendo estas cosas y nunca alguien me dijo nada. Algo raro esta pasando. Fui donde Isaac esa misma noche y le conte. El viejo me tranquilizo pero tenia los ojos distintos. Vine en el auto pensando una cosa fea: no se que estoy vendiendo en el gimnasio. Nunca supe. Lucia dormia cuando llegue. La mire un rato largo.
]]

T[6][8] = [[
Jueves, 29 de octubre - una foto de mi hija.

Llego una caja. Manzana. Placa con el 06. Y una foto de Lucia saliendo del colegio, tomada hoy a la tarde, desde un auto. UNA FOTO DE MI HIJA. Vomite dos veces en el bano. Me amenazan con mandar otra foto el lunes. Tengo que ir solo manana a un estacionamiento. Soy profesor de gimnasia. Tengo cuarenta kilos de ventaja sobre cualquier oficinista. Si es una pelea, peleo. Si me matan, peleo hasta el final. Lo unico que necesito es que Lucia no este en ningun cuadro. Lucia no. Lucia nunca.
]]

T[6][9] = [[
[Nota arrugada, encontrada en el asiento del auto abandonado]

si alguien encuentra esto: mi hija se llama Lucia Orozco, once anos, esta con la vecina Sra. Patterson en el edificio de calle Main 412. Avisenle a Servicios Sociales, mi prima Marta vive en Louisville, numero en la agenda. que no vaya al estado, por favor. LUCIA. LUCIA. LUCIA. soy Daniel Orozco y fui un buen padre. hice una cosa mal por ella. si al final le sirvio a ella, valio la pena. si no le sirvio, perdon.
]]

T[6][10] = [[
[Escrito semanas despues, letra de alguien muy cansado]

supe en el galpon lo que estaba vendiendo. supe lo del compuesto. pense en matar a Isaac con mis manos. no lo hice. no porque lo perdonara, sino porque Lucia no habria querido a un papa asesino. Isaac era util para que los demas sobrevivieran un poco mas, y yo elegi los demas sobre mi venganza. espero, hija, que hayas entendido de grande por que hice lo que hice en el gimnasio, y por que no mate al que me arruino la vida cuando pude. espero que estes viva. te pienso cada minuto. si esto lo lee alguien que algun dia te encuentre, dile que su papa la penso hasta el final. hasta el ultimo final.
]]

-- ============================================================================
-- SUJETO 07 - Dr. Isaac Volkov (Biologo)
-- ============================================================================
T[7] = {}

T[7][1] = [[
Cuaderno XVIII, 4 de marzo.

La senora Kerr volvio hoy a llevarse dos kilos de tomates. Camina derecha. Hace un ano no podia subir escaleras. Es la cuarta clienta que veo con mejoras que no deberian atribuirse a la dieta. Hay algo en los frutos que estoy produciendo. Marina, si todavia me escuchas, quiero que sepas que esto no era lo que planeaba. Pero ahora que lo veo, tampoco es algo que pueda dejar de ver.
]]

T[7][2] = [[
Cuaderno XIX, 12 de mayo.

Logre sintetizar el principio activo en una matriz de celulosa comprimida. Capsulas. Cuarenta miligramos. Equivalente a un mes de consumo del huerto. Las primeras pruebas en voluntarios (yo incluido, dos semanas) muestran: aumento de energia sostenida, mejor vision nocturna, libido elevada, cambios en el olor corporal (feromonas, probable). Marina habria reido hoy. Le habria gustado.
]]

T[7][3] = [[
Cuaderno XX, 3 de junio - el profesor.

Un hombre joven se detuvo hoy en la feria. Instructor de gimnasia. Viudo. Una hija. Tiene el aire desesperado de los que necesitan algo. Le dije que pasara por casa. Puede ser el. Puede ser mi puente. No quiero vender. Pero necesito distribuir. Necesito ver que hace el compuesto en cuarenta cuerpos distintos, no solo en uno. La ciencia no se hace sola.
]]

T[7][4] = [[
Cuaderno XX, 11 de julio - acuerdo.

Daniel acepto. Inventamos una historia por si alguien pregunta, un hombre anonimo en un estacionamiento, una mafia canadiense. Es mas creible que la verdad. La verdad nunca es creible. El no quiere saber. Yo no quiero decirle. Marina, anoche llore. No se si por la nina de el, por mi miedo, o por estar cerca de algo que llevo cuarenta anos buscando.
]]

T[7][5] = [[
Cuaderno XXI, 18 de septiembre - la enfermera.

Daniel vino esta noche. La clienta Vance no respondio al compuesto. Cero reaccion. Esto es imposible, segun mis datos. Cuarenta y un sujetos, cuarenta y una reacciones positivas. Vance es la excepcion. Vance es, entonces, la evidencia de que existe la siguiente iteracion. No es una falla del compuesto. Es un organismo mas avanzado. Empiezo seguimiento manana. Marina, creo que la encontre. Creo que encontre el siguiente escalon.
]]

T[7][6] = [[
Cuaderno XXI, 12 de octubre - seis.

He identificado seis sujetos con la misma marca biologica que Vance. Enfermera. Medico (su amante, por azar). Cajero de supermercado. Sacerdote. Mecanico. Profesor de gimnasia (si, el propio Daniel). La probabilidad estadistica de que seis individuos con esta rareza vivan en un radio de treinta millas es cero. Esto no es azar. Esto es biologia dirigida. La humanidad esta produciendo, de manera silenciosa, una siguiente fase. Y yo la he detectado antes que nadie.
]]

T[7][7] = [[
Cuaderno XXII, 30 de octubre - el galpon.

Tengo a los seis. El procedimiento fue limpio. Cebo personalizado para cada uno. Vance la mas facil. Hargreaves siguio a Vance, como predije. Delaney vino por su cuenta, el pobre. Cross por culpa. Malone por nostalgia. Orozco por la hija. Cada uno muerde su propio anzuelo. Estoy extrayendo muestras diarias. Version 2 en preparacion. Marina, duermo cuatro horas. Ya no te hablo en el porche. Hablo aqui. Perdon.
]]

T[7][8] = [[
Cuaderno XXII, 14 de noviembre - el octavo.

Identifique a un septimo sujeto compatible. Septimo, porque el grupo ahora es seis mas yo, pero por fuera del grupo seria el septimo y mi plan lo llama el octavo, asi que octavo se queda. No lo voy a incluir en los experimentos. No puedo explicarlo racionalmente. Lo mire desde un auto estacionado y algo en mi se quebro. No voy a tocarlo. Voy a hacer la unica cosa buena que puedo hacer a esta altura. Lo voy a proteger. Marina, si sigues ahi: ayudame a hacer esto bien.
]]

T[7][9] = [[
Cuaderno XXIII, 21 de noviembre - la cabana.

Lo sede con el retrogrado de memoria. Seis meses completos borrados. Lo lleve a la cabana del rio Jefferson. Cargue provisiones para un ano. Tranque las puertas. Le escribi una nota con lo minimo. Volvi a casa manejando despacio. Esta noche entrego la version 2 al contacto. Se que algo no esta bien en los ultimos resultados. Hay una inestabilidad proteica que no logro explicar. Pero el contacto presiona. Firme hace meses. Marina, perdoname. Si esto sale mal, la unica cosa limpia que voy a haber hecho fue la cabana.
]]

T[7][10] = [[
[Cuaderno XXIII, ultima entrada - despues del galpon, antes de escribir la carta para los dog tags]

Mis manos ya no obedecen del todo. Debo escribir rapido. Me equivoque. No era una evolucion. Era una enfermedad con sintomas de grandeza. Los mordidos no evolucionan: se pierden. Y yo lo entendi tarde. Los siete de mi galpon son mi culpa, y yo estoy entre los siete, y eso es una justicia minuscula pero es la unica que podia conseguir. Voy a escribir ahora la ultima nota, la que va en los dog tags. Voy a pedirles a los seis que decidan ellos. Yo no puedo decidir mas. Marina. Marina. El puente pasa solo. Ahora entiendo lo que me dijiste. Nunca fue metafora. Una sola persona pasa. El resto se queda del lado del que empezo. Adios.
]]
