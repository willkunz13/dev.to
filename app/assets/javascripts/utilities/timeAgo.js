'use strict';

function secondsToHumanUnitAgo(seconds) {
  const times = [
    ['second', 1],
    ['min', 60],
    ['hour', 60 * 60],
    ['day', 60 * 60 * 24],
    ['week', 60 * 60 * 24 * 7],
    ['month', 60 * 60 * 24 * 30],
    ['year', 60 * 60 * 24 * 365],
  ];

  if (seconds < times[0][1]) return 'just now';

  let scale = 0;
  // If the amount of seconds is more than a minute, we change the scale to minutes
  // If the amount of seconds then is more than an hour, we change the scale to hours
  // This continues until the unit above our current scale is longer than `seconds`, or doesn't exist
  while (scale + 1 < times.length && seconds >= times[scale + 1][1]) scale += 1;

  const wholeUnits = Math.floor(seconds / times[scale][1]);
  const unitName = times[scale][0] + (wholeUnits === 1 ? '' : 's');

  return wholeUnits + ' ' + unitName + ' ago';
}

function timeAgo({
  oldTimeInSeconds,
  formatter = humanTime =>
    `<span class="time-ago-indicator">(${humanTime})</span>`,
  maxDisplayedAge = 60 * 60 * 24 - 1,
}) {
  const timeNow = new Date() / 1000;
  const diff = Math.round(timeNow - oldTimeInSeconds);

  if (diff > maxDisplayedAge) return '';

  return formatter(secondsToHumanUnitAgo(diff));
}

// This is just for Storybook.
// TODO: Longterm, this should be a utility function that can be imported.
// For the time being, duplication of this function is being avoided.
if (typeof window !== 'undefined') {
  window.timeAgo = timeAgo;
}
