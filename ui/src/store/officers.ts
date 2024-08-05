import { writable } from "svelte/store";

export const OFFICERS = writable<OFFICERS_DATA[]>([]);

interface OFFICERS_DATA {
    id: string,
    cid: string,
    name: string,
    job: string,
    grade: string,
    onduty: boolean,
    callsign: string,
}