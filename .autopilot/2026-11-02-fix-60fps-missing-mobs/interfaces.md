# Интерфейсы и границы

## Границы, решённые в спецификации

| Модуль | Владеет | Выставляет | Прячет |
|---|---|---|---|
| `client_fps` | частотой отрисовки клиента | `client.fps`, `world.change_fps(new_fps)` | логику санитизации и автосинхронизации с тикрейтом |
| `glide_movement` | вычислением скорости скольжения | `DELAY_TO_GLIDE_SIZE(delay)` | формулу преобразования задержки в пиксели/тик |
| `vision_cone` | маскированием вне поля зрения | `update_vision_cone()`, `update_cone()` | оверлей собственного моба на верхнем плане |

## Построено в ходе сборки

- `client_fps`:
  - `preferences.dm`: дефолтный `clientfps = 0` (sync). Раскомментирована настройка FPS в меню персонажа.
  - `client_procs.dm`: `fps = (prefs.clientfps <= 0 || prefs.clientfps < world.fps) ? 0 : prefs.clientfps`
  - `preferences_savefile.dm`: санирование старого `clientfps` при загрузке.
  - `world.dm`: `change_fps(new_value)` обновляет `fps` всех игроков в `GLOB.clients`.
  - `general.dm`: дефолт `/datum/config_entry/number/fps` = 60.

- `glide_movement`:
  - `movement.dm`: `#define MIN_GLIDE_SIZE 1`, `#define MAX_GLIDE_SIZE world.icon_size`.
  - Плавное масштабирование скорости скольжения под `world.tick_lag`.

- `vision_cone`:
  - `incone.dm`: подсистеме `SSincone` добавлен флаг `SS_TICKER` для обновления каждый тик.
  - `login.dm`: в `Login()` вызывается инициализация конуса `update_vision_cone()` и `update_cone_show()`.
  - `vision_cone.dm`: сохранение смещения `pixel_x` и `pixel_y` оверлея персонажа.
  - Добавлен юнит-тест `movement_incone_sanity.dm`.
