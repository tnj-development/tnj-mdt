import { writable } from "svelte/store";

interface Notification {
    title?: string;
    message?: string;
}

export const NOTIFICATIONS = writable<Notification[]>([]);

export function Notify(title?: string, message?: string) {
    const notification: Notification = {
        title: title ?? "",
        message: message ?? "",
    };

    NOTIFICATIONS.update((notifications) => {
        notifications.push(notification);
        if (notifications.length > 1) {
            notifications.shift();
        }
        return notifications;
    });

    setTimeout(() => {
        NOTIFICATIONS.update((notifications) => {
            const index = notifications.indexOf(notification);
            if (index > -1) {
                notifications.splice(index, 1);
            }
            return notifications;
        });
    }, 2500);
}
