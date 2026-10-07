return {
    stories = {
        desc = "故事架构",
        lines = {
            "---",
            "title: ",
            "date: '{{date}}'",
            "last_modified: '{{last_modified}}'",
            "---",
            "",
        },
        cursor = { row = 2, col = 7 },
        enter_insert = true,
    },
    draft = {
        desc = "正文",
        lines = {
            "---",
            "title: ",
            "date: '{{date}}'",
            "last_modified: '{{last_modified}}'",
            "type: ",
            "chars: [  ]",
            "tags: [  ]",
            "history: [  ]",
            "description: ",
            "words: 0",
            "---",
            "",
        },
        cursor = { row = 2, col = 7 },
        enter_insert = true,
    },

}
