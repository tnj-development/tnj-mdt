import { readable, writable } from "svelte/store";

export const VISIBILITY = writable<boolean>(false);
export const BROWSER_MODE = writable<boolean>(false);
export const RESOURCE_NAME = writable<string>("");

export const hoverState = writable(false);
export const transparencyLevel = writable(1);

export const ACTIVE_PAGE = writable<ACTIVE_PAGE_DATA>({ value: "", component: null });

interface ACTIVE_PAGE_DATA {
  value: string;
  component: any;
}