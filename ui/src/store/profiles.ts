import { writable } from "svelte/store";

export const SEARCH = writable("");

export const SELECTED_PROFILE = writable<PROFILE_DATA>();
export const PROFILES = writable<PROFILE_DATA[]>([]);

interface PROFILE_DATA {
    id: string,
    cid: string,
    information: string,
    tags: string[],
    gallery: string[],
    pfp: string,
    fingerprint: string,
    jobtype: string,
    fullname: string,
    birthdate: string,
    phoneNumber: string,
    gender: number,
    licences: any[],
    job: string,
    jobGrade: string,
}