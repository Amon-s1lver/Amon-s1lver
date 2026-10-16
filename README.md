# ML Portfolio — Junior ML Engineer

Начинающий ML-инженер, студент 3 курса бакалавриата **Университета Иннополис** (2024 – 2028).
Ищу позицию **Junior ML Engineer** или стажировку в области машинного обучения и работы с данными.

📄 **Резюме:** [Resume_Junior_ML_Engineer.pdf](https://github.com/Amon-s1lver/Amon-s1lver/blob/main/resume/Resume_Junior_ML_Engineer.pdf)

## Навыки

| Область | Навыки |
|---|---|
| Языки и библиотеки | Python, PyTorch, scikit-learn, pandas, NumPy |
| Базы данных | PostgreSQL, SQL (CTE, оконные функции, витрины признаков) |
| Машинное обучение | обучение и сравнение моделей, нейронные сети, квантизация, устойчивость моделей, работа с LLM, воспроизводимые эксперименты |
| Инструменты | Jupyter Notebook, Google Colab, Kaggle, VS Code, Git, LaTeX |

Языки: русский — родной, английский — B2.

## Проекты

| Проект | Тема | Стек |
|---|---|---|
| [Квантованные функции активации](https://github.com/Amon-s1lver/Amon-s1lver/tree/main/projects/P14-quantized-activations) | квантизация нейросетей, QAT, устойчивость | NumPy, scikit-learn |
| [Прогноз оттока клиентов: SQL + ML](https://github.com/Amon-s1lver/Amon-s1lver/tree/main/projects/churn-sql-ml) | SQL-аналитика, табличный ML, бизнес-метрики | SQL, scikit-learn, pandas |
| [Детектор SMS-спама и его устойчивость](https://github.com/Amon-s1lver/Amon-s1lver/tree/main/projects/spam-robustness) | NLP, adversarial-атаки и защиты | PyTorch, scikit-learn |

---

### [P14. Квантованные функции активации](https://github.com/Amon-s1lver/Amon-s1lver/tree/main/projects/P14-quantized-activations)

Учебный исследовательский проект (команда из 2 человек): что будет, если квантовать
не только веса нейросети, но и **значения функций активации**.

- Равномерное квантование выходов `tanh`, табличная (LUT) и кусочно-линейная (PWL) аппроксимации — с нуля на NumPy
- MLP 64→128→64→10 на `digits` (scikit-learn), точность в float32 — **0.971**
- 1–2 бита на активацию дают точность **≈0.960**, при 4+ битах ответы модели не меняются
- PTQ vs QAT: для 2-битных весов QAT поднимает точность с **0.927 до 0.980**
- Обнаружена маскировка градиента у LUT: наивная FGSM-атака даёт ложную устойчивость (0.973),
  STE-атака снижает точность до **0.062**

[Код (Jupyter)](https://github.com/Amon-s1lver/Amon-s1lver/blob/main/projects/P14-quantized-activations/P14_quantized_activations.ipynb) ·
[Отчёт (PDF)](https://github.com/Amon-s1lver/Amon-s1lver/blob/main/projects/P14-quantized-activations/report.pdf)

<p align="center">
  <img src="https://github.com/Amon-s1lver/Amon-s1lver/raw/main/projects/P14-quantized-activations/images/weights_x_activations.png" width="360" alt="Точность при сочетаниях битности весов и активаций">
  <img src="https://github.com/Amon-s1lver/Amon-s1lver/raw/main/projects/P14-quantized-activations/images/ptq_vs_qat.png" width="440" alt="PTQ vs QAT">
</p>

### [Прогноз оттока клиентов: SQL-аналитика + ML](https://github.com/Amon-s1lver/Amon-s1lver/tree/main/projects/churn-sql-ml)

Пайплайн от сырых данных до бизнес-решения: таблица в БД → SQL-аналитика → SQL-витрина признаков →
модели → выбор порога по экономике удержания. Данные: Telco Customer Churn (7043 клиента).

- SQL: CTE, `CASE`, оконные функции (`SUM() OVER`, `RANK()`), представление-витрина признаков
- Помесячный контракт даёт **42.7%** оттока и **87%** потерянной выручки; худший сегмент — 60% оттока
- LogReg / RandomForest / Gradient Boosting: CV ROC-AUC **≈ 0.84**, PR-AUC ≈ 0.66
- Порог по экономике удержания (подобран на out-of-fold) — **+33% прибыли** к порогу 0.5,
  находит 76% уходящих клиентов вместо 48%

[Ноутбук](https://github.com/Amon-s1lver/Amon-s1lver/blob/main/projects/churn-sql-ml/churn_sql_ml.ipynb) ·
[SQL-запросы](https://github.com/Amon-s1lver/Amon-s1lver/tree/main/projects/churn-sql-ml/sql)

<p align="center">
  <img src="https://github.com/Amon-s1lver/Amon-s1lver/raw/main/projects/churn-sql-ml/images/sql_churn_segments.png" width="560" alt="Отток по сегментам">
</p>

### [Детектор SMS-спама и его устойчивость к обфускации](https://github.com/Amon-s1lver/Amon-s1lver/tree/main/projects/spam-robustness)

Насколько легко обойти спам-фильтр, если исказить текст (`free` → `fr33`, `f.r.e.e`), и какие защиты работают.

- 4 модели: TF-IDF (слова / символы) + NB / LogReg и **CharCNN на PyTorch**; лучшая — TF-IDF по символам: F1 **0.969**
- White-box атака по самым «спамным» словам снижает recall словесной модели с **0.926 до 0.736**
- Защиты: нормализация текста возвращает recall до 0.890 без потери качества;
  нормализация + adversarial augmentation — до **0.951**
- Атака гомоглифами (не встречалась при обучении) показывает, что защиты не обобщаются на новые типы искажений

[Ноутбук](https://github.com/Amon-s1lver/Amon-s1lver/blob/main/projects/spam-robustness/spam_robustness.ipynb)

<p align="center">
  <img src="https://github.com/Amon-s1lver/Amon-s1lver/raw/main/projects/spam-robustness/images/attacks.png" width="640" alt="Атаки на спам-фильтр">
</p>

## Структура репозитория

```
.
├── README.md
├── resume/
│   └── Resume_Junior_ML_Engineer.pdf
└── projects/
    ├── P14-quantized-activations/   # квантование активаций: ноутбук, отчёт, графики
    ├── churn-sql-ml/                # отток клиентов: SQL-запросы, ноутбук, графики
    └── spam-robustness/             # спам-фильтр и атаки: ноутбук, графики
```

Каждый проект содержит свой README с результатами, `requirements.txt` и инструкцией по запуску.
