# Q1. Первый коммит

Ты установил Git и скачал свою копию репозитория. Теперь разберёмся, как устроен этот день, сделаем первый коммит и отправим его на GitHub.

## Как устроен этот день

Ты работаешь в **своей копии** репозитория (форке), которую сделал в Q0. После каждого задания ты отправляешь работу на GitHub, и проверяющие сразу видят, какие задания ты прошёл.

**Правила дня:**

1. **Одно задание — одна ветка.** Работай и делай коммиты только в ветке текущего задания.
2. **Закончил задание — сделай коммит и отправь его на GitHub командой `git push`.** Задание считается сданным, только когда твоя работа видна на GitHub. То, что осталось на компьютере, проверяющие не видят.
3. **Ошибся — исправь и отправь снова.** Новый коммит, снова `git push` — и всё. Ошибаться можно и нужно: так учатся все программисты.
4. **Читай, что пишет Git.** Почти всегда он сам подсказывает, что делать дальше.
5. **Застрял — спроси.** Спрашивать — нормально.

---

## Шаг 1. Где я?

Первым делом всегда проверяй, в какой ветке ты находишься. Убедись, что терминал открыт в папке репозитория:

```bash
cd ~/projects/TASK_1
```

И спроси Git о текущем состоянии:

```bash
git status
```

Если всё в порядке, ответ будет таким:

```
On branch q1
Your branch is up to date with 'origin/q1'.

nothing to commit, working tree clean
```

Первая строка — главная: **`On branch q1`** означает «ты в ветке `q1`».

### Я не в той ветке!

Если в первой строке написана другая ветка (например, `On branch main`), переключись на нужную:

```bash
git switch q1
```

Git ответит примерно так:

```
branch 'q1' set up to track 'origin/q1'.
Switched to a new branch 'q1'
```

`Switched to ... 'q1'` — переключение прошло успешно. Проверь ещё раз через `git status`.

### Какие вообще есть ветки?

Посмотреть все ветки можно так:

```bash
git branch -a
```

```
* q1
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
  remotes/origin/q1
  remotes/origin/q2
  remotes/origin/q3
```

- Звёздочка `*` отмечает ветку, в которой ты сейчас.
- Строки `remotes/origin/...` — ветки, которые лежат на GitHub. Это и есть все задания дня.

---

## Шаг 2. Создай файл `about.md`

Создадим файл с информацией о тебе. Сначала пустой файл:

```bash
touch about.md
```

Команда `touch` создаёт пустой файл. Теперь открой его в Блокноте:

```bash
notepad about.md
```

Скопируй в Блокнот этот шаблон и заполни своими данными:

```markdown
# Обо мне

- **ФИО:** Петров Иван Сергеевич
- **Группа:** 120

## О себе

Учусь на программиста, люблю играть в шахматы. Хочу научиться делать программы, которыми пользуются настоящие компании.
```

> 💡 **Раздел «О себе» заполнять не обязательно.** Можешь написать пару предложений, а можешь оставить его пустым или вообще удалить. Главная цель задания - научиться делать коммиты, а не писать сочинения.

Сохрани файл (**Ctrl + S**) и закрой Блокнот. Проверь, что файл на месте:

```bash
cat about.md
```

Команда должна вывести то, что ты написал.

---

## Шаг 3. Сделай коммит

### Как Git сохраняет изменения

Сохранение в Git происходит в два шага. Представь, что ты отправляешь посылку:

```
  📁 Папка проекта   ──── git add ────►   📦 Коробка   ──── git commit ────►   📜 История
  (ты меняешь файлы)                   (что отправим)                     (сохранено навсегда)
```

1. **`git add`** — кладёшь файлы в коробку. Можно положить один файл, а можно несколько.
2. **`git commit`** — заклеиваешь коробку, подписываешь её и отправляешь в историю. Это и есть коммит.

Зачем два шага? Иногда ты изменил 5 файлов, а сохранить хочешь только 2. `git add` позволяет выбрать, что именно попадёт в коммит.

### 3.1. Посмотри состояние

```bash
git status
```

```
On branch q1
Your branch is up to date with 'origin/q1'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        about.md

nothing added to commit but untracked files present (use "git add" to track)
```

**`Untracked files`** — «неотслеживаемые файлы». Git видит новый файл `about.md`, но пока не следит за ним. Обрати внимание: в скобках Git сам подсказывает, что делать — `use "git add <file>..."`.

### 3.2. Положи файл в коробку — `git add`

```bash
git add about.md
```

Если всё хорошо, команда ничего не ответит. В терминале тишина — это значит «успешно». Проверим:

```bash
git status
```

```
On branch q1
Your branch is up to date with 'origin/q1'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   about.md
```

**`Changes to be committed`** — «изменения, которые попадут в коммит». Файл лежит в коробке, а пометка `new file` значит, что это новый файл.

> 💡 Вместо имени файла можно написать точку: `git add .` — она добавит **все** изменённые файлы сразу. Удобно, но осторожно: так легко закоммитить что-то лишнее. Пока лучше указывай файлы по имени.

### 3.3. Сохрани — `git commit`

```bash
git commit -m "Добавил about.md"
```

- `-m` — сокращение от *message* (сообщение).
- В кавычках — описание коммита. Обычно там пишут, что именно сделано.

Git ответит примерно так:

```
[q1 3f9c2a1] Добавил about.md
 1 file changed, 7 insertions(+)
 create mode 100644 about.md
```

- `q1` — ветка, в которой сделан коммит;
- `3f9c2a1` — уникальный номер коммита (хеш). У тебя он будет другим;
- `1 file changed, 7 insertions(+)` — изменён 1 файл, добавлено 7 строк.

Проверим состояние ещё раз:

```bash
git status
```

```
On branch q1
Your branch is ahead of 'origin/q1' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```

- **`ahead of 'origin/q1' by 1 commit`** — у тебя на компьютере на 1 коммит больше, чем на GitHub. GitHub пока ничего не знает о твоём коммите.
- **`working tree clean`** — всё сохранено, несохранённых изменений нет.

Обрати внимание: Git сам подсказывает следующий шаг — `use "git push"`. Его мы сделаем в шаге 4.

---

## Шаг 4. Отправь работу на GitHub — `git push`

Пока твой коммит существует только на твоём компьютере. Отправим его в твою копию на GitHub:

```bash
git push
```

**В первый раз** появится окно входа в GitHub. Нажми **Sign in with your browser**, в открывшемся браузере подтверди вход (**Authorize**) и вернись в терминал — отправка продолжится сама. Больше Git спрашивать не будет.

Git ответит примерно так:

```
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 8 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 412 bytes | 412.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/ivan-petrov/TASK_1.git
   8b41d0e..3f9c2a1  q1 -> q1
```

Главное здесь — последние две строки:

- `To https://github.com/ivan-petrov/TASK_1.git` — куда отправлено. Там должен быть **твой ник**;
- `q1 -> q1` — твоя ветка `q1` отправлена в ветку `q1` на GitHub.

Проверим состояние:

```bash
git status
```

```
On branch q1
Your branch is up to date with 'origin/q1'.

nothing to commit, working tree clean
```

**`up to date with 'origin/q1'`** — у тебя и на GitHub теперь одно и то же.

```
3f9c2a1 (HEAD -> q1, origin/q1) Добавил about.md
8b41d0e Задание Q1: первый коммит
c72e5f4 (origin/main, origin/HEAD) Q0: установка и настройка Git
```

Пометка `origin/q1` переехала на твой коммит — GitHub догнал тебя.

### Проверь на GitHub

Открой в браузере свою копию: `https://github.com/ТВОЙ_НИК/TASK_1`. Нажми на кнопку с названием ветки и выбери `q1`. В списке файлов должен появиться `about.md`, а над списком — твой коммит `Добавил about.md`. Нажми на `about.md` — GitHub покажет его красиво оформленным.

Именно это и увидят проверяющие. 🎉

---

## Нашёл ошибку или хочешь что-то дописать?

Без проблем — например, если захочешь заполнить «О себе» позже. Открой файл, исправь, сохрани и повтори тот же цикл, **включая `git push`**:

```bash
git add about.md
git commit -m "Дописал раздел о себе"
git push
```

В этот раз `git status` покажет не `Untracked files`, а `modified: about.md` — Git уже следит за этим файлом и видит, что он изменился.

Именно так и работают программисты: небольшое изменение → `add` → `commit` → `push`. И снова по кругу.

---

## Чек-лист

- [ ] `git status` показывает `On branch q1`
- [ ] в файле `about.md` есть ФИО и номер группы
- [ ] в `git log` в строке `Author:` стоят твои имя и почта
- [ ] `git status` показывает `up to date with 'origin/q1'` и `working tree clean`
- [ ] на GitHub в твоей копии, в ветке `q1`, виден файл `about.md`

---

## Если что-то пошло не так

<details>
<summary><code>fatal: not a git repository</code></summary>

Ты находишься не в папке репозитория. Перейди в неё:

```bash
cd ~/projects/TASK_1
```
</details>

<details>
<summary><code>error: pathspec 'q1' did not match any file(s) known to git</code></summary>

Git не нашёл ветку с таким именем. Проверь, нет ли опечатки, и посмотри список веток командой `git branch -a`.
</details>

<details>
<summary><code>nothing added to commit</code> или <code>nothing to commit</code></summary>

Ты забыл сделать `git add` перед `git commit`, или файл не сохранён. Сохрани файл в Блокноте (Ctrl + S), затем выполни `git add about.md` и снова `git commit -m "Добавил about.md"`.
</details>

<details>
<summary>Написал <code>git commit</code> без <code>-m</code>, и открылся Блокнот</summary>

Ничего страшного: Git просит написать сообщение коммита. Напиши его в первой строке (например, `Добавил about.md`), сохрани файл (Ctrl + S) и закрой Блокнот — коммит создастся.
</details>

<details>
<summary><code>git push</code>: <code>Permission to NotAXaliks/TASK_1.git denied</code> или <code>403</code></summary>

Ты пытаешься отправить работу в репозиторий организаторов, а не в свою копию. Посмотри, куда смотрит твой репозиторий:

```bash
git remote -v
```

Если в адресе стоит `NotAXaliks`, а не твой ник, значит, в Q0 ты скачал не свою копию. Поменяй адрес на свой (если форка ещё нет — сначала сделай его, см. Q0):

```bash
git remote set-url origin https://github.com/ТВОЙ_НИК/TASK_1.git
```

Подставь свой ник вместо `ТВОЙ_НИК`, проверь ещё раз через `git remote -v` и снова выполни `git push`.
</details>

<details>
<summary><code>git push</code>: <code>Permission to ТВОЙ_НИК/TASK_1.git denied to ЧУЖОЙ_НИК</code></summary>

Компьютер помнит аккаунт GitHub человека, который работал за ним до тебя. Нажми **Пуск**, найди **Диспетчер учётных данных** → **Учётные данные Windows** и удали все записи, которые начинаются с `git:https://github.com`. Затем снова выполни `git push` и войди в свой аккаунт.
</details>

<details>
<summary><code>git push</code>: <code>Everything up-to-date</code></summary>

Отправлять нечего: либо ты уже всё отправил, либо забыл сделать коммит. Проверь `git status`.
</details>

<details>
<summary><code>git push</code>: <code>! [rejected] ... (fetch first)</code></summary>

На GitHub есть изменения, которых нет у тебя (например, ты редактировал файл прямо на сайте). Сначала скачай их, а потом отправь своё:

```bash
git pull
git push
```

Если после `git pull` откроется Блокнот — просто закрой его.
</details>

<details>
<summary><code>warning: ... LF will be replaced by CRLF ...</code></summary>

Это не ошибка, а предупреждение о разных форматах переноса строк в Windows и Linux. Просто не обращай внимания.
</details>

<details>
<summary>В <code>Author:</code> не мои имя или почта</summary>

Настрой их заново (см. шаг 5 в задании Q0), а затем перезапиши автора последнего коммита:

```bash
git commit --amend --reset-author --no-edit
```
</details>

---

## Что дальше

Когда чек-лист выполнен и `git status` показывает `up to date with 'origin/q1'` и `working tree clean`, переключайся на следующее задание:

```bash
git switch q2
```

И читай новый `README.md`:

```bash
cat README.md
```

> 💡 Перед переключением ветки всегда проверяй `git status`. Если там есть несохранённые изменения — сначала сделай коммит. Если написано `ahead of ...` — сначала сделай `git push`.
