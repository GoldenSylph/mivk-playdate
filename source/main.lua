-- CoreLibs
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

-- Libraries
import "libraries/animatedSprite/AnimatedSprite"
import "libraries/ldtk/LDtk"
import "libraries/panels/Panels"

-- Game
import "cutscenes/gameCredits.lua"
import "cutscenes/mivk.lua"

import "scripts/player"
import "scripts/gameScene"
import "scripts/ability"
import "scripts/spike"
import "scripts/spikeball"

Panels.credits = gameCredits

local pd <const> = playdate
local gfx <const> = playdate.graphics

local cutsceneIsPlaying = false

function cutsceneDidFinish()
    cutsceneIsPlaying = false
end

function startCutScene(cutScene)
    cutsceneIsPlaying = true
    Panels.startCutscene(cutScene, cutsceneDidFinish)
end

GameScene(startCutScene)

function pd.update()
    if cutsceneIsPlaying then
        Panels.update()
    else
        gfx.sprite.update()
        pd.timer.updateTimers()
    end
end