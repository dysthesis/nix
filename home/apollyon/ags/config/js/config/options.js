import { USER } from 'resource:///com/github/Aylur/ags/utils.js';

function resetOptions() {
    exec(`rm -rf ${CACHE_FILE}`);
    cacheObj = {};
    getOptions().forEach(opt => opt.reset());
}

function getValues() {
  const obj = {};
  for (const opt of getOptions()) {
    if (opt.category !== 'exclude')
      obj[opt.id] = opt.value;
  }

  return JSON.stringify(obj, null, 2);
}

/** @param {string | object} config */
export function apply(config) {
    const options = getOptions();
    const settings = typeof config === 'string'
        ? JSON.parse(config) : config;

    for (const id of Object.keys(settings)) {
        const opt = options.find(opt => opt.id === id);
        if (!opt) {
            print(`No option with id: "${id}"`);
            continue;
        }

        opt.setValue(settings[id]);
    }
}

/** @returns {Array<Opt<any>>} */
function getOptions(object = options, path = '') {
    return Object.keys(object).flatMap(key => {
        /** @type Option<any> */
        const obj = object[key];
        const id = path ? path + '.' + key : key;

        if (obj instanceof Opt) {
            obj.id = id;
            return obj;
        }

        if (typeof obj === 'object')
            return getOptions(obj, id);

        return [];
    });
}

export default {
  reset: resetOptions,
  values: getValues,
  apply: apply,
  list: getOptions,
}
