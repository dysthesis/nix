import { USER } from 'resource:///com/github/Aylur/ags/utils.js';

function resetOptions() {
    exec(`rm -rf ${CACHE_FILE}`);
    cacheObj = {};
    getOptions().forEach(opt => opt.reset());
}

export default {
  reset: resetOptions,
}
