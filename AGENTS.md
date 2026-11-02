<!-- autopilot:start -->
# KalachikTOWN (Rogue Town Fork)

SS13-based codebase for KalachikTOWN running at 60 FPS.

## Команды

| Команда | Что делает |
|---------|------------|
| `BUILD.bat` или `dm.exe roguetown.dme` | Скомпилировать roguetown.dme |
| `dm.exe -DUNIT_TESTS roguetown.dme` | Скомпилировать roguetown.dme с юнит-тестами |
| `DreamDaemon.exe roguetown.dmb [port] -trusted -safe` | Запустить сервер |

## Архитектура частоты кадров и движения (60 FPS)

- Сервер и мир работают на 60 FPS (`code/world.dm` и конфигурация `config_entry/number/fps` по умолчанию равны 60, `world.tick_lag ≈ 0.1667`).
- Клиенты (`client.fps`): по умолчанию `clientfps = 0` (автоматическая синхронизация с тикрейтом сервера). Запрещено `client.fps < world.fps`, чтобы предотвратить пропуск кадров и исчезновение мобов. При вызове `world.change_fps()` обновляются все клиенты из `GLOB.clients`.
- Движение (`glide_size`): макрос `DELAY_TO_GLIDE_SIZE(delay)` в `code/__DEFINES/movement.dm` масштабирует скорость скольжения под `world.tick_lag` в диапазоне от `MIN_GLIDE_SIZE 1` до `MAX_GLIDE_SIZE world.icon_size` (32).
- Поле зрения (`vision_cone`): все мобы находятся на плоскости `GAME_PLANE_FOV_HIDDEN`, а собственный оверлей моба выносится на `GAME_PLANE_UPPER`. Подсистема `SSincone` работает с флагом `SS_TICKER` (каждый тик), а при входе в игру (`/mob/living/Login()`) гарантированно вызывается `update_vision_cone()` и `update_cone()`.

## Как здесь работает Autopilot

Сборка ведётся навыком `/autopilot`. Требования, спецификация и таски — в `.autopilot/`.
Прогресс — `.autopilot/dashboard.html`. Правило: требование из `manifest.md`
может снять только пользователь.

Если работа продолжается — скажи «продолжи автопилот»: состояние поднимется
из `.autopilot/state.js`, переспрашивать ничего не нужно.
<!-- autopilot:end -->
