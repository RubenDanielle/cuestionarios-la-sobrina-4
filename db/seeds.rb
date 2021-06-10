#clean dataset
Survey.all.map {|s| s.destroy}
Response.all.map {|r| r.destroy}
Outcome.all.map {|o| o.destroy}
Choice.all.map {|c| c.destroy}
Question.all.map {|q| q.destroy}
Career.all.map {|c| c.destroy}

#create careers

agronomia    = Career.create(name: 'Agronomia')
arquitectura = Career.create(name: 'Arquitectura')
arte         = Career.create(name: 'Arte')
computacion  = Career.create(name: 'Computación')
economia     = Career.create(name: 'Economía')
edFisica     = Career.create(name: 'Educación Física')
filosofia    = Career.create(name:'Filosofía')
fisica       = Career.create(name: 'Física')
geologia     = Career.create(name: 'Geología')
historia     = Career.create(name: 'Historia')
literatura   = Career.create(name: 'Literatura')
matematicas  = Career.create(name: 'Matemáticas')
medicina     = Career.create(name: 'Medicina')
periodismo   = Career.create(name: 'Periodismo')
quimica      = Career.create(name: 'Química')
sociologia   = Career.create(name: 'Sociología')
veterinaria  = Career.create(name: 'Veterinaria')

#create questions, choices and outcomes in order

#first question
preg1 = Question.create(name: 'Pregunta N° 1', description: 'Me trasladaría a una zona agrícola - ganadera para ejercer mi profesión.', number: 1, type: 'Single Choice')
    
    ch1_preg1 = Choice.create(text: 'Si', question_id: preg1.id)

        out1_ch1_preg1 = Outcome.create(choice: ch1_preg1, career: veterinaria)
        out2_ch1_preg1 = Outcome.create(choice: ch1_preg1, career: agronomia)

    ch2_preg1 = Choice.create(text: 'No', question_id: preg1.id)

#second question
preg2 = Question.create(name: 'Pregunta N° 2', description: 'Tengo buena memoria y no me cuesta estudiar y retener fórmulas y palabras técnicas.', number: 2, type: 'Single Choice')

    ch1_preg2 = Choice.create(text: 'Si', question_id: preg2.id)

        out1_ch1_preg2 = Outcome.create(choice: ch1_preg2, career: fisica)
        out2_ch1_preg2 = Outcome.create(choice: ch1_preg2, career: matematicas)
        out3_ch1_preg2 = Outcome.create(choice: ch1_preg2, career: quimica)
        out4_ch1_preg2 = Outcome.create(choice: ch1_preg2, career: computacion)

    ch2_preg2 = Choice.create(text: 'No', question_id: preg2.id)

#third question
preg3 = Question.create(name: 'Pregunta N° 3', description: 'Me gusta escribir. En general mis trabajos son largos y están bien organizados.', number: 3, type: 'Single Choice')

    ch1_preg3 = Choice.create(text: 'Si', question_id: preg3.id)

        out1_ch1_preg3 = Outcome.create(choice: ch1_preg3, career: literatura)
        out2_ch1_preg3 = Outcome.create(choice: ch1_preg3, career: historia)

    ch2_preg3 = Choice.create(text: 'No', question_id: preg3.id)

#fourth question
preg4 = Question.create(name: 'Pregunta N° 4', description: 'Sé quien es Steven Hawking: Conozco y me atraen sus descubrimientos.', number: 4, type: 'Single Choice')
    
    ch1_preg4 = Choice.create(text: 'Si', question_id: preg4.id)

        out1_ch1_preg4 = Outcome.create(choice: ch1_preg4, career: fisica)
    
    ch2_preg4 = Choice.create(text: 'No', question_id: preg4.id)

#fifth question
preg5 = Question.create(name: 'Pregunta N° 5', description: 'Me actualizo respecto de los avances tecnológicos y me intereso por investigar y conocer.', number: 5, type: 'Single Choice')

    ch1_preg5 = Choice.create(text: 'Si', question_id: preg5.id)

        out1_ch1_preg5 = Outcome.create(choice: ch1_preg5, career: computacion)

    ch2_preg5 = Choice.create(text: 'No', question_id: preg5.id)

#sixth question
preg6 = Question.create(name: 'Pregunta N° 6', description: 'Sé quien es Andy Warhol y a qué movimiento artístico pertenece. Me apasiona conocer acerca del arte y sus exponentes.', number: 6, type: 'Single Choice')
    ch1_preg6 = Choice.create(text: 'Si', question_id: preg6.id)

        out1_ch1_preg6 = Outcome.create(choice: ch1_preg6, career: arte)

    ch2_preg6 = Choice.create(text: 'No', question_id: preg6.id)

#seventh question
preg7 = Question.create(name: 'Pregunta N° 7', description: 'En general me intereso por las dificultades que ha tenido que atravesar la humanidad y cómo lo ha superado.', number: 7, type: 'Single Choice')
    ch1_preg7 = Choice.create(text: 'Si', question_id: preg7.id)

        out1_ch1_preg7 = Outcome.create(choice: ch1_preg7, career: historia)

    ch2_preg7 = Choice.create(text: 'No', question_id: preg7.id)

#eighth question
preg8 = Question.create(name: 'Pregunta N° 8', description: 'Me apasiona leer y no me importa si el libro que elijo tiene muchas páginas, para mí es un gran entretenimiento.', number: 8, type: 'Single Choice')
    ch1_preg8 = Choice.create(text: 'Si', question_id: preg8.id)

        out1_ch1_preg8 = Outcome.create(choice: ch1_preg8, career: literatura)
        out2_ch1_preg8 = Outcome.create(choice: ch1_preg8, career: historia)

    ch2_preg8 = Choice.create(text: 'No', question_id: preg8.id)

#nineth question
preg9 = Question.create(name: 'Pregunta N° 9', description: 'Me atrae conocer los procesos y las áreas que hacen funcionar a las empresas.', number: 9, type: 'Single Choice')
    ch1_preg9 = Choice.create(text: 'Si', question_id: preg9.id)

        out1_ch1_preg9 = Outcome.create(choice: ch1_preg9, career: economia)
        
    ch2_preg9 = Choice.create(text: 'No', question_id: preg9.id)

#tenth question
preg10 = Question.create(name: 'Pregunta N° 10', description: 'Me siento identificado con el pensamiento de algunos filósofos y escritores.', number: 10, type: 'Single Choice')
    ch1_preg10 = Choice.create(text: 'Si', question_id: preg10.id)

        out1_ch1_preg10 = Outcome.create(choice: ch1_preg10, career: filosofia)
        out2_ch1_preg10 = Outcome.create(choice: ch1_preg10, career: historia)

    ch2_preg10 = Choice.create(text: 'No', question_id: preg10.id)

#eleventh question
preg11= Question.create(name: 'Pregunta Nº 11 ', description: 'Me encanta estudiar el cuerpo humano y conocer cómo funciona. Además, no me impresiona la sangre.', number: 11, type: 'Single Choice')
    
    ch1_preg11 = Choice.create(text: 'Si', question_id: preg11.id)
        
        out1_ch1_preg11 = Outcome.create(choice: ch1_preg11, career: medicina)
    
    ch2_preg11 = Choice.create(text: 'No', question_id: preg11.id)

#twelveth question
preg12 = Question.create(name: 'Pregunta Nº 12 ', description: 'Si pudiera elegir, pasaría mucho tiempo diseñando novedosos objetos o edificios en mi computadora.', number: 12, type: 'Single Choice')
    
    ch1_preg12 = Choice.create(text: 'Si', question_id: preg12.id)
        
        out1_ch1_preg12 = Outcome.create(choice: ch1_preg12, career: computacion)
        out2_ch1_preg12 = Outcome.create(choice: ch1_preg12, career: arquitectura)
    
    ch2_preg12 = Choice.create(text: 'No', question_id: preg12.id)

#thirteenth question
preg13 = Question.create(name: 'Pregunta Nº 13 ', description: 'Si mi blog fuera temático, trataría acerca de: ', number: 13, type: 'Single Choice')
    
    ch1_preg13 = Choice.create(text: ' La importancia de la expresión artística en el desarrollo de la identidad de los pueblos.', question_id: preg13.id)
        
        out1_ch1_preg13 = Outcome.create(choice: ch1_preg13, career: sociologia)
    
    ch2_preg13 = Choice.create(text: ' La arquelogía urbana como forma de aprender acerca de la historia cultural de una ciudad.', question_id: preg13.id)
        
        out1_ch2_preg13 = Outcome.create(choice: ch2_preg13, career: historia)
    
    ch3_preg13 = Choice.create(text: ' La tecnología satelital en un proyecto para descubrir actividad volcánica para prevenir catástrofes climáticas.', question_id: preg13.id) 
        
        out1_ch3_preg13 = Outcome.create(choice: ch3_preg13, career: computacion)
        out2_ch3_preg13 = Outcome.create(choice: ch3_preg13, career: geologia)
    
    ch4_preg13 = Choice.create(text: 'Ninguna de las opciones.', question_id: preg13.id)

#fourteenth question
preg14 = Question.create(name: 'Pregunta Nº 14 ', description: 'Integraría un equipo de trabajo encargado de producir un audiovisual sobre: ', number: 14, type: 'Single Choice')
    
    ch1_preg14 = Choice.create(text: ' La práctica de deportes y su influencia positiva en el estado de ánimo de las personas.', question_id: preg14.id)
        
        out1_ch1_preg14 = Outcome.create(choice: ch1_preg14, career: edFisica)
    
    ch2_preg14 = Choice.create(text: 'Los pensadores del siglo XX y su aporte a la gestión de las organizaciones.', question_id: preg14.id)
        
        out1_ch2_preg14 = Outcome.create(choice: ch2_preg14, career: filosofia)
        out2_ch2_preg14 = Outcome.create(choice: ch2_preg14, career: historia)
    
    ch3_preg14 = Choice.create(text: 'Las mascotas y su incidencia en la calidad de vida de las personas no videntes.', question_id: preg14.id) 
        
        out1_ch3_preg14 = Outcome.create(choice: ch3_preg14, career: veterinaria)
    
    ch4_preg14 = Choice.create(text: 'El uso de la PC como herramienta para el control de los procesos industriales.', question_id: preg14.id)
        
        out1_ch4_preg14 = Outcome.create(choice: ch4_preg14, career: computacion)
    
    ch5_preg14 = Choice.create(text: 'Procesos productivos de una empresa', question_id: preg14.id)
        
        out1_ch5_preg14 = Outcome.create(choice: ch5_preg14, career: economia)
    
    ch6_preg14 = Choice.create(text: 'Ninguna de las opciones.', question_id: preg14.id)

#fifteenth question
preg15 = Question.create(name: 'Pregunta Nº 15 ', description: 'Sería importante destacarme como: ', number: 15, type: 'Single Choice')
    
    ch1_preg15 = Choice.create(text: 'Director de una investigación técnico científica', question_id: preg15.id)
        
        out1_ch1_preg15 = Outcome.create(choice: ch1_preg15, career: fisica)
        out2_ch1_preg15 = Outcome.create(choice: ch1_preg15, career: quimica)
        out3_ch1_preg15 = Outcome.create(choice: ch1_preg15, career: computacion)
    
    ch2_preg15 = Choice.create(text: 'Gerente general de una empresa reconocida por su responsabilidad social.', question_id: preg15.id)
        
        out1_ch2_preg15 = Outcome.create(choice: ch2_preg15, career: economia)
    
    ch3_preg15 = Choice.create(text: 'Un deportista famoso por su destreza física y su ética profesional.', question_id: preg15.id) 
        
        out1_ch3_preg15 = Outcome.create(choice: ch3_preg15, career: edFisica)
    
    ch4_preg15 = Choice.create(text: 'Experto en la detección precoz de enfermedades neurológicas en niños.', question_id: preg15.id)
        
        out1_ch4_preg15 = Outcome.create(choice: ch4_preg15, career: medicina)
    
    ch5_preg15 = Choice.create(text: 'Un agente de prensa audaz, número uno en el ranking de notas a celebridades.', question_id: preg15.id)
        
        out1_ch5_preg15 = Outcome.create(choice: ch5_preg15, career: periodismo)
    
    ch6_preg15 = Choice.create(text: 'Ninguna de las opciones.', question_id: preg15.id)