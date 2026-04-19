-- Collection Core: estado de la colección de diarios descubiertos por el
-- jugador. Los dog tags reutilizan el estado de Echoes.Core (st.dogtags[n].
-- collected) como fuente unica de verdad.
--
-- Estructura:
--   md.EchoesCollection = {
--       version = 1,
--       diaries = {
--           [subjectID] = { [entryN] = { t = timestampMs } }
--       }
--   }

Echoes = Echoes or {}
Echoes.Collection = Echoes.Collection or {}

local COLLECTION_MODDATA_KEY = "EchoesCollection"
local COLLECTION_VERSION = 1

Echoes.Collection.TOTAL_SUBJECTS = 7
Echoes.Collection.TOTAL_DIARIES_PER_SUBJECT = 10

function Echoes.Collection.getState(player)
    player = player or getPlayer()
    if not player then return nil end
    local md = player:getModData()
    local st = md[COLLECTION_MODDATA_KEY]
    if not st or type(st) ~= "table" then
        st = { version = COLLECTION_VERSION, diaries = {} }
        md[COLLECTION_MODDATA_KEY] = st
    end
    st.diaries = st.diaries or {}
    st.version = COLLECTION_VERSION
    return st
end

-- Diary discovery ------------------------------------------------------------

function Echoes.Collection.isDiaryDiscovered(subjectID, entryN, player)
    local st = Echoes.Collection.getState(player)
    if not st then return false end
    local bucket = st.diaries[subjectID]
    return bucket and bucket[entryN] ~= nil
end

-- Returns true if this is the first time we discover this diary.
function Echoes.Collection.markDiaryDiscovered(subjectID, entryN, player)
    local st = Echoes.Collection.getState(player)
    if not st then return false end
    st.diaries[subjectID] = st.diaries[subjectID] or {}
    if st.diaries[subjectID][entryN] then return false end
    local t = getTimestampMs and getTimestampMs() or 0
    st.diaries[subjectID][entryN] = { t = t }
    return true
end

function Echoes.Collection.countDiariesForSubject(subjectID, player)
    local st = Echoes.Collection.getState(player)
    if not st or not st.diaries[subjectID] then return 0 end
    local count = 0
    for _ in pairs(st.diaries[subjectID]) do
        count = count + 1
    end
    return count
end

function Echoes.Collection.countDiariesTotal(player)
    local total = 0
    for s = 1, Echoes.Collection.TOTAL_SUBJECTS do
        total = total + Echoes.Collection.countDiariesForSubject(s, player)
    end
    return total
end

-- Dog tag discovery (delegates to Echoes.Core) -------------------------------

function Echoes.Collection.isTagDiscovered(subjectID, player)
    local st = Echoes.getState and Echoes.getState(player)
    if not st or not st.dogtags then return false end
    local dt = st.dogtags[subjectID]
    return dt and dt.collected == true
end

function Echoes.Collection.countTagsTotal(player)
    local count = 0
    for s = 1, Echoes.Collection.TOTAL_SUBJECTS do
        if Echoes.Collection.isTagDiscovered(s, player) then
            count = count + 1
        end
    end
    return count
end

-- Progress aggregates --------------------------------------------------------

-- Returns { diariesFound, diariesTotal, tagFound (bool), totalFound, totalTotal, pct }
function Echoes.Collection.getSubjectProgress(subjectID, player)
    local diariesFound = Echoes.Collection.countDiariesForSubject(subjectID, player)
    local tagFound = Echoes.Collection.isTagDiscovered(subjectID, player)
    local total = Echoes.Collection.TOTAL_DIARIES_PER_SUBJECT + 1
    local found = diariesFound + (tagFound and 1 or 0)
    return {
        diariesFound = diariesFound,
        diariesTotal = Echoes.Collection.TOTAL_DIARIES_PER_SUBJECT,
        tagFound = tagFound,
        totalFound = found,
        totalTotal = total,
        pct = (total > 0) and (found / total) or 0,
    }
end

-- Returns overall progress across all subjects.
function Echoes.Collection.getOverallProgress(player)
    local diariesFound = Echoes.Collection.countDiariesTotal(player)
    local diariesTotal = Echoes.Collection.TOTAL_SUBJECTS
        * Echoes.Collection.TOTAL_DIARIES_PER_SUBJECT
    local tagsFound = Echoes.Collection.countTagsTotal(player)
    local tagsTotal = Echoes.Collection.TOTAL_SUBJECTS
    local found = diariesFound + tagsFound
    local total = diariesTotal + tagsTotal
    return {
        diariesFound = diariesFound,
        diariesTotal = diariesTotal,
        tagsFound = tagsFound,
        tagsTotal = tagsTotal,
        totalFound = found,
        totalTotal = total,
        pct = (total > 0) and (found / total) or 0,
    }
end
