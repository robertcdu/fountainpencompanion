import { matchSorter } from "match-sorter";

/**
 * @param {any[]} rows
 * @param {string | undefined} filterValue
 * @returns {any[]}
 */
export function fuzzyMatch(rows, filterValue) {
  if (!filterValue) {
    return rows;
  }

  const attrs = [
    "brand_name",
    "line_name",
    "ink_name",
    "maker",
    "comment",
    "private_comment"
  ];

  return matchSorter(rows, filterValue.replace(/\s+/gi, ""), {
    keys: [(row) => attrs.map((a) => row[a]).join("")]
  });
}
