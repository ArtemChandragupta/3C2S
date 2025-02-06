#import "./template.typ": *

#show: conf.with(
  title:   "Конспект лекций по предмету",
  subject: "Теория Турбомашин",
  teacher: "Семакина Елена Юрьевна",
)

= КПД турбины

#figure(
  cetz.canvas(length:1.5cm, {
    import cetz.draw: *
    set-style(
      mark: (transform-shape: false, fill: black)
    )
    // Variables
    let axis_L =  5
    let cz     = -5
    let c1u    = -5
    let u      =  3
    let c2u    =  0

    // Axis
    line(name:"axisu", (axis_L,0),(-axis_L,0), mark:(end: "stealth"))
    line(name:"axisz", (   0  ,0),(0,cz - .5), mark:(end: "stealth"))
    content("axisu.end", $U$, padding:.2, anchor:"north-west" )
    content("axisz.end", $z$, padding:.1, anchor:"south-west" )

    // First triangle
    line(name:"C1", (  0  ,0 ),(c1u  ,cz), mark:(end:"stealth", fill:red), stroke:red)
    line(name:"W1", (  0  ,0 ),(c1u+u,cz), mark:(end:"stealth", fill:red), stroke:red)
    line(name:"u1", (c1u+u,cz),(c1u  ,cz), mark:(end:"stealth", fill:red), stroke:red)
    content("C1.end", $C_1$, padding:.1, anchor:"north")
    content("W1.end", $W_1$, padding:.1, anchor:"north")
    content("u1.mid", $u$,   padding:.1, anchor:"north")

    // Second triangle
    line(name:"C2", (  0  ,0 ),(c2u  ,cz), mark:(end:"stealth", fill:blue), stroke:blue)
    line(name:"W2", (  0  ,0 ),(c2u+u,cz), mark:(end:"stealth", fill:blue), stroke:blue)
    line(name:"u2", (c2u+u,cz),(c2u  ,cz), mark:(end:"stealth", fill:blue), stroke:blue)
    content("C2.end", $C_2$,       padding:.1, anchor:"east" )
    content("W2.end", $W_2$,       padding:.1, anchor:"north")
    content("u2.mid", $u=W_(z 2)$, padding:.1, anchor:"north")

    // Angles
    cetz.angle.angle((0,0), "axisu.end",  "W1.end", label:$beta_1$,    label-radius:120%, mark:(symbol:"stealth"), radius:1)
    cetz.angle.angle((0,0), "axisu.end",  "C1.end", label:$alpha_1$,   label-radius:110%, mark:(symbol:"stealth"), radius:2)
    cetz.angle.angle((0,0), "W2.end","axisu.start", label:$beta_2^*$,  label-radius:110%, mark:(symbol:"stealth"), radius:2)
    cetz.angle.angle((0,0), "C2.end","axisu.start", label:$alpha_2^*$, label-radius:120%, mark:(symbol:"stealth"), radius:1)
  })
)

#teo(name: "Адиабатический КПД")[
  Оценивает гидравлическое совершенство турбины:

  $ eta_"ад"=(L_1-difference(L_"НА")-difference(L_"РК"))/L_t $
]

#imp(name: "Окружной КПД - Важнейший")[
  Характеризует эффективность турбины по величине энергии переданной на лопатки РК. Он характеризует совершенство проточной части и учитывает потери с выходной скоростью:

  $ eta_"u"=L_u/L_t= (u_1 c_(1u)-u_2 c_(2u))/( (k R)/(k-1) T_0^* [1- (p_2/p_0^*)^((k-1)/k)] ) $

  Учитывает потери в НЛ и РЛ и с выходной скоростью:
  $ eta_u=H_u/H_0 approx (H_0-difference(H_1)-difference(H_2)-H_"вс")/(H_0) $

  Окружной КПД по параметрам торможения характеризует степень гидродинамического совершенства турбинной ступени:
  $ eta_u^*=H_u/H_0^* approx (H_0-difference(H_1)-difference(H_2)-H_"вс")/(H_0-H_"вс") $

  Адиабатический КПД также характеризует степень гидродинамического совершенства турбин:
  $ eta_"ад"=H/H_0 approx (H_0-difference(H_1)-difference(H_2))/(H_0) $
]

#teo(name: "Внутренний КПД (мощностной)")[
  Характеризует эффективность турбины по величине энергии переданной на выходной вал турбины:

  $ eta_"ад"= L_e/L_t $
]

