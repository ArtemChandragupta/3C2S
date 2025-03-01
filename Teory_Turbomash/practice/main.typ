#import "./template.typ": *

#show: conf.with(
  title:   "Практика по предмету",
  subject: "Теория Турбомашин",
  teacher: "Семакина Елена Юрьевна",
)

= Первая практика

Закон сохранения энергии для стационарного течения:
$ h+c^2/2 =h^*="const" $

$ h^*-h=c_p(T^*-T) "  " c_p= k/(k-1) R "  " T^*=T+c^2/(2 c_p) $

$ T^* = T (1+ (k-1)/2 c^2/(k R T) ) "  " c_(1 t)^2/2 = h_0^* - h_(1t) = c_p (T_0^* -T_(1t)) $

#teo(name: "Изоэнтропийное течение")[
  Закон сохранения энергии для изоэнтропийного течения:
  $ h+ c^2/2 = h^* ="const" $
  В изоэнтропийном процессе температура и давления связаны уравнением:
  $ p/p^* = (T/T^*)^ (1/(k-1)) $
]

Далее показывают газодинамические функции.

Задача 1:

Рассчитать параметры изоэнетропийного течения на выходе из сопла, найти площади минимального и выходного сечений.

#let T00 = 429
#let p00 = 0.3
#let p1 = 0.098
#let G = 0.3
#let k = 1.4
#let R = 287

$
  T_0^* &= #T00 &"К"\
  p_0^* &= #p00 &"МПа"\
  p_1   &= #p1 &"МПа"\
  G     &= #G &"кг/с"\
  k     &= #k &"-"\
  R     &= #R &"Дж"/("кг" dot "K")
$

Задача 2:

Расчитать число $M_c_1$, параметры изоэнтропийного течения на выходе из диффузора, найти параметры потока воздуха на входе в диффузор, а также $M_c_2$, входную и выходную скорость диффузора.

#let T1 = 300
#let p1 = 0.1
#let c1 = 150
#let c2 = 50
#let G = 20
#let etaD = 0.8
#let k = 1.4
#let R = 287

$
  T_1 &= #T1 & "К"\
  p1 &= #p1 & "МПа"\
  c_1   &= #c1 & "м/с"\
  c_2   &= #c2 & "м/с"\
  G     &= #G & "кг/с"\
  eta_д &= #etaD & "-"\
  k     &= #k & "-"\
  R     &= #R & "Дж"/("кг" dot "K")
$

Решение:

#let a1 = calc.sqrt(k * R * T1)
#let Mc1 = c1/a1
#let cp = k/(k - 1) * R
#let tau1 = 1/(1 + (k - 1)/2 * Mc1 * Mc1)
#let T11 = T1/tau1
#let pi1 = calc.pow(tau1, (k/(k - 1)))
#let p11 = p1 / pi1

$
  a_1 = sqrt(k R T_1) &= #a1 \
  M_c_1 = c_1/a_1 &= #Mc1 \
  c_p = k/(k-1) R &= #cp \
  tau_1 = 1/(1+ (k-1)/2 M^2) &= tau1\
  T_1^* = T_1 /tau_1 &= T11\
  pi_1 = tau_1^(k/(k-1)) &= pi1\
  p^*_1 = p_1/pi_1 &= #p11\
  H_t = c_1^2 
$

= Вторая практика

= Третья практика

*Характеристики потерь энергии*

= Четвёртая практика

#{
  let H0 = 100
  let Rt = 0.3
  let a1 = 10
  let phi = 0.97
  let npr = 0.91
  let n = 3000

  table(
    columns:(1fr,1fr,1fr),
    $H_0$,    [#H0], [КДж/кг],
    $rho_T$,  [#Rt], [-],
    $alpha_1$,[#a1], [0],
    $phi$,    [#phi],[-],
    $eta^*_u$,[#npr],[-],
    $n$,      [#n],  [об/мин]
  )
  [Примаем, что $c_(1 z)=c_(2 z)$]

  table(
    columns:(1fr,1fr,1fr),
    $H_1$,      [],[],
    $H_2$,      [],[],
    $c_1$,      [],[],
    $c_(1 u)$,  [],[],
    $c_(1 z)$,  [],[],
    $C_0$,      [],[],
    $H^*_0$,    [],[],
    $H_u$,      [],[],
    $Delta H_1$,[],[],
    $Delta H_2$,[],[],
    $u$,        [],[],
    $u / C^2_0$,[],[],
    $D$,        [],[],
    $w_1$,      [],[],
    $w_2$,      [],[],
    $beta_1$,   [],[],
    $beta_2$,   [],[],
    $epsilon_2$,[],[],
    $psi$,      [],[],
    $eta_u$,    [],[],
    $rho_k$,    [],[],
  )
}



