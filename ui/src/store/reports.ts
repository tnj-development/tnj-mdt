import { writable } from "svelte/store";

export const SEARCH = writable("");

export const SELECTED_REPORTS = writable<INCIDENTS_DATA>();
export const REPORTS = writable<INCIDENTS_DATA[]>([]);

interface INCIDENTS_DATA {
    id: number;
    author: string;
    title: string;
    type: string;
    details: string;
    tags: string[];
    officersinvolved: string[];
    civsinvolved: string[];
    gallery: string[];
    time: string;
    jobtype: string;
    last_updated: string;
}