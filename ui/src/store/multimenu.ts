import { writable } from "svelte/store";

export const ACTIVE_MULTI_MENU = writable<ACTIVE_MULTI_MENU_DATA>({ icon: "", value: "", component: null });

interface ACTIVE_MULTI_MENU_DATA {
    icon: string;
    value: string;
    component: any;
}