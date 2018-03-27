export const booleanValue = (v) => {
  return v === '' || v === 'true'
}

export const numberValue = (v) => {
  return v && parseInt(v)
}
