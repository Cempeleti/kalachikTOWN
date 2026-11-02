window.STATE =
{
  "slug": "fix-60fps-missing-mobs",
  "dir": "2026-11-02-fix-60fps-missing-mobs",
  "title": "Исправление исчезновения персонажей при 60 FPS",
  "mode": "semi",
  "depth": "normal",
  "polish": null,
  "tier": "T1",
  "briefFile": "2026-11-02-brief.md",
  "memoryFile": "AGENTS.md",
  "skillDir": "C:/Users/Aleksei/.gemini/config/skills/autopilot",
  "startedAt": "2026-11-02T21:13:30+02:00",
  "updatedAt": "2026-11-02T21:48:00+02:00",
  "finishedAt": "2026-11-02T21:48:00+02:00",
  "stages": [
    { "id": "preflight", "status": "done", "startedAt": "2026-11-02T21:13:30+02:00", "finishedAt": "2026-11-02T21:14:50+02:00" },
    { "id": "manifest",  "status": "done", "startedAt": "2026-11-02T21:14:50+02:00", "finishedAt": "2026-11-02T21:15:10+02:00" },
    { "id": "briefing",  "status": "skipped", "note": "вопросов не потребовалось" },
    { "id": "spec",      "status": "done", "startedAt": "2026-11-02T21:15:20+02:00", "finishedAt": "2026-11-02T21:15:50+02:00" },
    { "id": "plan",      "status": "done", "startedAt": "2026-11-02T21:15:50+02:00", "finishedAt": "2026-11-02T21:17:00+02:00", "note": "2 таска, ярус T1" },
    { "id": "build",     "status": "done", "startedAt": "2026-11-02T21:17:00+02:00", "finishedAt": "2026-11-02T21:46:00+02:00", "note": "2 из 2 тасков готовы" },
    { "id": "review",    "status": "done", "startedAt": "2026-11-02T21:24:00+02:00", "finishedAt": "2026-11-02T21:47:00+02:00", "note": "проверено 2 из 2" },
    { "id": "final",     "status": "done", "startedAt": "2026-11-02T21:47:00+02:00", "finishedAt": "2026-11-02T21:48:00+02:00" }
  ],
  "requirements": {
    "total": 6, "done": 6, "inTicket": 0, "inSpec": 0,
    "placeholder": 0, "deferred": 0, "dropped": 0
  },
  "tickets": [
    {
      "id": "01",
      "title": "Синхронизация client.fps и конфигурации 60 FPS",
      "requirements": ["R01", "R03i", "R06i"],
      "blockedBy": [],
      "wave": 1,
      "zone": ["code/modules/client/", "code/game/", "code/controllers/"],
      "status": "done",
      "startedAt": "2026-11-02T21:17:30+02:00",
      "finishedAt": "2026-11-02T21:24:10+02:00",
      "commit": "a5316d9",
      "tests": { "passed": 1, "failed": 0 },
      "retries": 0,
      "repairs": 0,
      "handoffs": 0
    },
    {
      "id": "02",
      "title": "Масштабирование движения (glide_size) и синхронизация FOV/SSincone при 60 FPS",
      "requirements": ["R01.1", "R02", "R04i", "R05i"],
      "blockedBy": ["01"],
      "wave": 2,
      "zone": ["code/__DEFINES/", "code/modules/mob/", "code/controllers/subsystem/processing/"],
      "status": "done",
      "startedAt": "2026-11-02T21:24:30+02:00",
      "finishedAt": "2026-11-02T21:47:15+02:00",
      "commit": "0c65776",
      "tests": { "passed": 2, "failed": 0 },
      "retries": 0,
      "repairs": 1,
      "repairFindings": ["bad embedded expression [2.5, 2.8] in unit test string"],
      "handoffs": 0
    }
  ],
  "singlePass": null,
  "tests": { "passed": 2, "failed": 0 },
  "debt": { "placeholders": [], "assumptions": [], "emptyEnv": [] },
  "additions": [],
  "coverage": { "found": 0, "fixed": 0, "deferred": 0 },
  "concerns": [],
  "reviewers": { "manifestSpec": null, "craft": null },
  "blind": {
    "verdict": "agreed",
    "summary": "Все требования брифа выполнены. Клиентский FPS синхронизирован с world.fps, glide_size масштабируется под 60 FPS, SSincone обновляется каждый тик, персонажи отображаются корректно."
  }
}
