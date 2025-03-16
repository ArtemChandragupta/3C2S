#import "./template.typ": *

#show: conf.with(
  title:   "Практика по предмету",
  subject: "Теория Автоматического регулирования",
  teacher: "Суханов Владимир Андреевич",
)

#heading(numbering:none)[Термины]

#show "САР": name => text(blue)[_#name _]
САР - система автоматического регулирования;

= Вводная практика

Первая практическая работа:\
Исследование влияния параметров САР паровой турбины на качество переходных процессов.

Заплечник золотника - его поршеньки. Букса - корпус.

Характерные параметры:
- $T_a, [c]$ - Постоянная времени ротора. Характеризует инерционность ротора. От $5.1$ до $12$. Время, необходимое для удвоения скорости вращения ротора.
- $T_pi,[c]$ - Постоянная времени паровой ёмкости. $approx 0.15 c$
- $T_s,[c]$ - Постоянная времени сервомотора. $approx 0.3 c$
- $1/(delta_omega)$ - величина, пропорциональная коэффициенту усиления разомкнутой системы $delta_omega = (omega_"xx"-omega_"нн")/omega_"опт"= 4.5 #sym.plus.minus 0.5% $
\

Рассмотрим координаты состояния САР:
- $phi$ - относительное изменение угловой скорости ротора турбины и генератора. Характеризует ошибку регулирования.
- $pi$  - относииельное изменение давления пара в паровой ёмкости.
- $xi$  - относительное изменение положения регулирующего органа.
- $eta$ - относительное изменение положения выходной координаты элемента сравнения.

- $zeta_"му"$ - относительное изменение положения механизма управления турбиной.
- $nu_г$      - относительное изменение нагрузки на генераторе.

= Из

$ cases(
  T_a dd(phi)/dd(t) = pi - nu_Г &"- уравнение ротора" \
  T_pi dd(pi)/dd(t) + pi = xi &"- уравнение паровой ёмкости"\
  T_s dd(xi)/dd(t) + xi =eta &"- уравнение мотора"\
  eta = - phi/delta_omega + zeta_"му" &"- уравнение сумматора"
) $

В операторной форме:

$ cases(
  T_a lambda phi = pi - nu_Г &"- уравнение ротора" \
  T_pi lambda pi + pi = xi &"- уравнение паровой ёмкости"\
  T_s lambda xi + xi =eta &"- уравнение мотора"\
  eta = - phi/delta_omega + zeta_"му" &"- уравнение сумматора"
) $

$ cases(
  phi = 1/(T_a dot lambda) dot (pi - nu_Г)\
  pi  = 1/(T_pi dot lambda + 1) dot xi\
  xi  = 1/(T_s dot lambda + 1) dot eta\
  eta = - phi/(delta_omega) + zeta_"му"
) $

#figure(
  cetz.canvas(length: 1cm, {
    import cetz.draw: *
    set-style(
      grid: (
        stroke: gray + .2pt,
        step: .5
      ),
      mark: (
        transform-shape: false,
        fill: black
      ),
      stroke:(cap:"round")
    )
    // Variables
    let field = 6
    let P1 = ( 2 , .5)
    let P2 = (0.4,2.5)
    let P3 = ( 1 ,2.5)
    let P4 = ( 5 , .5)

    scale(1.5)
    grid((0,0), (field - .5, field - 3))
    line((0,0), (field - .5, 0), mark: (end: "stealth"))
    line((0,0), (0, field - 3), mark: (end: "stealth"))
    
    content((0 - .2,field - 3), $phi$ )
    content((field - .5,0-0.3), $t$ )

    hobby((0,0),(1,2.5),(1.5,2.7),(2,1.7),(3,1.2),(4,1.5),(5,1.5))

    line(name:"SA",(5,0),(5,1.5),mark:(symbol:"stealth"),stroke:(dash:"dashed"))
    content("SA.mid",[Статическая ошибка\ регулирования], anchor: "west", padding:0.2)
  }),
)

$
  dd(phi) / dd(t) = dd(xi) / dd(t) =dd(pi) / dd(t)=0 \
  pi=nu_Г=xi=eta\
  eta = - phi_"уст"/delta_omega + zeta_"му"\
  eta_Г = - phi_"уст"/delta_omega + zeta_"му"\
  phi_"уст" = delta_omega (zeta_"му" - nu_Г) = delta_omega zeta_"му" - delta_omega nu_Г = -1 = delta_omega
$

#figure(
  [
    #cetz.canvas({
      import cetz.draw: *
      set-style(
        mark: (
          transform-shape: false,
          fill: black
        )
      )

      rect(name:"зу",(0,0),(1,1))
      circle(name:"lamp1",(2.5,0.5),radius:0.5)
      arc((2.5,.5),radius:0.5,mode:"PIE",   start:225deg, delta:90deg, fill:black, anchor:"origin")
      arc((2.5,.5),radius:0.5,mode:"CLOSE", start:45deg, delta:180deg, anchor:"origin")
      arc((2.5,.5),radius:0.5,mode:"CLOSE", start:-45deg, delta:180deg, anchor:"origin")

      circle(name:"lamp2",(8.5,0.5),radius:0.5)
      arc((8.5,.5),radius:0.5,mode:"PIE",   start:-225deg, delta:-90deg, fill:black, anchor:"origin")
      arc((8.5,.5),radius:0.5,mode:"CLOSE", start:45deg, delta:180deg, anchor:"origin")
      arc((8.5,.5),radius:0.5,mode:"CLOSE", start:-45deg, delta:180deg, anchor:"origin")

      line(name:"nug", (8.5,2),(8.5,1), mark:(end:"stealth") )
      content("nug.mid", $nu_Г$, anchor:"south-east", padding:.1)

      rect(name:"у" ,(3.5,0),(5,1))
      rect(name:"ро",(6,0),(7.5,1))
      rect(name:"ор",(9.5,0),(10.5,1))
      rect(name:"чэ",(6,-2),(7,-3))

      content("зу","зу")
      content("у" ,$1/(T_s  lambda + 1)$ )
      content("ро",$1/(T_pi lambda + 1)$)
      content("ор",$1/(T_a lambda)$)
      content("чэ",$1/delta_omega$)

      line((1,.5),(2,.5))
      line((1,.5),(1.5,.5),mark:(end:"stealth") )
      line((3,.5),(3.5,.5))
      line((3,.5),(3.4,.5),mark:(end:"stealth") )
      line((5,.5),(6,.5))
      line((5,.5),(5.7,.5),mark:(end:"stealth") )
      content((5.5,1),$xi$,anchor:"south")
      line((7.5,.5),(8,.5))
      line((7.5,.5),(7.9,.5),mark:(end:"stealth") )

      line((2.5,0),(2.5,-2.5),(6,-2.5))
      line((11,0.5),(11,-2.5),(7,-2.5))
      line((5,-2.5),(4,-2.5),mark:(end:"stealth") )
      line((9,-2.5),(8,-2.5),mark:(end:"stealth") )

      line((9,.5),(9.5,.5), mark:(end:"stealth") )
      content((11,1),$phi$)
      content("lamp1.north-east", $eta$, anchor:"south-west")
      content("lamp2.north-west", $pi$, anchor:"south-east")
      content("зу.north-east",   $zeta_"му"$, anchor:"south-west")
      line((10.5,.5),(11.5,.5), mark:(end:"stealth") )
    })
  ],
  caption: [Структурная схема матмодели САР],
)

= Демонстрация

Передаточные функции - отношение преобразованных по Лаплассу выходной ко входной величине при нулевых начальных условиях и .... Это -- динамическая харатеристика звена.

Из операторной форме можно перейти к структурной форме.



