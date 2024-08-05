import { writable } from "svelte/store";

export const PERMISSIONS = writable<PERMISSIONS_DATA[]>([]);

interface PERMS {
    create_incident: number;
    delete_incident: number;
    create_report: number;
    delete_report: number;
    create_announcement: number;
    delete_announcement: number;
    create_warrant: number;
    delete_warrant: number;
    create_bolo: number;
    delete_bolo: number;
    hire: number;
    fire: number;
    logs: number;
  }

interface PERMISSIONS_DATA {
    leo: PERMS;
    ems: PERMS;
    doj: PERMS;
  }