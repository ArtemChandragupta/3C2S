#import "./template.typ": *

#show: conf.with(
  title:   "Конспект лекций по предмету",
  subject: "Камеры сгорания, парогенераторы и теплообменники",
  teacher: "Бондарчук Антон Андреевич",
)

= Вводная лекция

#teo(name:"Требования к авиационным топливам")[
  - Высокая массовая удельная теплота сгорания $H_u$
  - Высокая плотность $rho_T$
  - Доступность сырьевых ресурсов
  - Стабильные физико-химические свойства
  - Низкая токсичность
  - Оптимальная испаряемость
]

Параметры углеводородных топлив и топливо-воздушных смесей:
- $H_u$ - количество теплоты, которое выделяется при полном сгорании топлива
- $eta_г$ - коэффициент полноты сгорания. $eta_г= Q_ф/Q_т=Q_ф/(G_т dot H_u)$
- $L_0$ - стехиометрический коэффициент - масса воздуха, необходимая для сгорания $1 к г$ топлива
- $alpha$ - коэффициент избытка воздуха. $alpha=G_в/(L_0 dot G_m) = 1/(L_0 dot q_m) $
- $M_i$ - молярная масса

== Лекция 2

#teo(name:"Уравнение энергии в термической форме")[
  $ c_p T_1 + c_1^2/2 + Q_1 + L_0 = c_p T_2 + c_2^2/2 $
  $ L_0=0; $
  $ c_p T_к^* + Q_1= c_p T_г^* $
]
$ q_Т = G_Т/G_В "- относительный расход топлива" $

$ eta_г = (G_В Q_1)/(G_Т H_u) = Q_1/Q_0 = "внесённая теплота"/"располагаемая теплота" $

$ sigma_"кс" = P^*_г/P^*_к $

Надёжность:
+ $ alpha_max-alpha_min "- диапазон устойчивой работы кс" $
+ $ Theta_i = (T^*-T^*)/(T^*-T^*) $

Суммы энтальпий.

$ G_В C_p^(T_г) T_к^* + G_T C_p $

$ q_T = G_T/G_В = (c_p (T^* +T^*))/(H_u eta_г) "- соновопологающая формула" $

Задача 1

Задача 2


