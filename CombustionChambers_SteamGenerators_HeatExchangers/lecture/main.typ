#import "./template.typ": *

#show: conf.with(
  title:   "Конспект лекций по предмету",
  subject: "Камеры сгорания, парогенераторы и теплообменники",
  teacher: "Бондарчук Антон Андреевич",
)

#heading(numbering:none)[Термины]

#show "САР": name => text(blue)[_#name _]
САР - система автоматического регулирования;

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
