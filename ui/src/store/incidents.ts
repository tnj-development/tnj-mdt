import { writable } from "svelte/store";

export const SEARCH = writable("");

export const SELECTED_INCIDENTS = writable<INCIDENTS_DATA>();
export const INCIDENTS = writable<INCIDENTS_DATA[]>([]);

interface INCIDENTS_DATA {
    id: number;
    author: string;
    title: string;
    details: string;
    tags: string[];
    officersinvolved: string[];
    civsinvolved: string[];
    criminalsinvolved: CRIMINALS_INVOLVED[];
    evidence: string[];
    time: string;
    jobtype: string;
}

interface CRIMINALS_INVOLVED {
    name: string;
    charges: CHARGES_DATA[];
}

interface CHARGES_DATA {
    id: number;
    name: string;
    description: string;
    fine: number;
    jailtime: number;
}